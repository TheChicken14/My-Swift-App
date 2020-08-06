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
    
    @IBOutlet weak var typeSelector: NSPopUpButton!
    
    @IBOutlet weak var label: NSTextField!
    
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

