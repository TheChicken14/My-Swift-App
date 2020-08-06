//
//  ViewController.swift
//  My App
//
//  Created by Wisse Hes on 05/08/2020.
//  Copyright © 2020 Wisse Hes. All rights reserved.
//

import Cocoa

struct Azura_song: Decodable {
    let title, artist, text, art: String
}

struct Azura_now_playing: Decodable {
    let song: Azura_song
}

struct AzuraCastNowPlayingStructure: Decodable {
    let cache: String
    let now_playing: Azura_now_playing
}

func getApiData( completion: @escaping (AzuraCastNowPlayingStructure)->()) {
    let session = URLSession.shared
    let url = URL(string: "https://radio.chickenfm.com/api/nowplaying/1")!

    let task = session.dataTask(with: url) { data, response, error in

        if error != nil || data == nil {
            print("Client error!")
            return
        }


        do {
            let json = try JSONDecoder().decode(AzuraCastNowPlayingStructure.self, from: data!)
            completion(json)
        } catch {
            print("JSON error: \(error.localizedDescription)")
        }
    }

    task.resume()
}

class ViewController: NSViewController {

    @IBOutlet weak var textField1: NSTextField!
    @IBOutlet weak var textField2: NSTextField!
    
    @IBOutlet weak var typeSelector: NSPopUpButton!
    
    @IBOutlet weak var label: NSTextField!
    
    @IBOutlet weak var nowPlayingLabel: NSTextField!
    
    var ret: String = "Loading...";
    
    @IBAction func buttonClicked(_ sender: Any) {
        if Int(textField1.stringValue) == nil || Int(textField2.stringValue) == nil  {
            label.stringValue = "Both values should be a number!"
        } else {
            if typeSelector.title == "+" {
                 let num1 = Int(textField1.stringValue)!
                 let num2 = Int(textField2.stringValue)!
                
                 let done = num1 + num2
                 
                 label.integerValue = done
            } else if typeSelector.title == "x" {
                 let num1 = Int(textField1.stringValue)!
                 let num2 = Int(textField2.stringValue)!
                
                 let done = num1 * num2
                 
                 label.integerValue = done
            } else if typeSelector.title == "-" {
                 let num1 = Int(textField1.stringValue)!
                 let num2 = Int(textField2.stringValue)!
                
                 let done = num1 - num2
                 
                 label.integerValue = done
            }
        }
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        nowPlayingLabel.stringValue = "Loading..."
        getApiData() { (data) -> () in
            self.ret = data.now_playing.song.text
            DispatchQueue.main.async {
                   self.nowPlayingLabel.stringValue = self.ret
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getApiData() { (data) -> () in
            self.ret = data.now_playing.song.text
            DispatchQueue.main.async {
                   self.nowPlayingLabel.stringValue = self.ret
                }
        }

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

