//
//  ViewController.swift
//  My App
//
//  Created by Wisse Hes on 05/08/2020.
//  Copyright © 2020 Wisse Hes. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField1: NSTextField!
    @IBOutlet weak var textField2: NSTextField!
    
    @IBOutlet weak var label: NSTextField!
    
    @IBAction func buttonClicked(_ sender: Any) {
        if Int(textField1.stringValue) == nil || Int(textField2.stringValue) == nil  {
            label.stringValue = "Both values should be a number!"
        } else {
            var num = Int(textField1.stringValue)
            num! += Int(textField2.stringValue)!
            
            label.integerValue = num!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

