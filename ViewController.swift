//
//  ViewController.swift
//  Converter
//
//  Created by Azaan Majeed on 2019-05-22.
//  Copyright © 2019 Azaan Majeed. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {                          // creating rounded buttons
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Display: UILabel!                    // creating label
    @IBAction func Numbers(_ sender: UIButton) {
        Display.text = Display.text! + String(sender.tag-1) // display numbers onto screen
    }
    
    @IBAction func ClearDot(_ sender: UIButton) {
        
        if sender.tag == 11{                                // if back arrow pressed
            var text = Display.text!
            text = String(text.dropLast())                  // drop the last character typed
            Display.text = text
            
        }
            
        else if sender.tag == 12{                           // if clear button pressed
            Display.text = ""                               // clear screen
        
        }
    }
    
    @IBAction func Operations(_ sender: UIButton) {
        
        var numonScreen = Int(Display.text!)!               // creating variables to be operated on
        var result = [String]()
        var remainder = 0
        
        if sender.tag == 13{                                // if binary button pressed
            while numonScreen > 0 {                         // while number displayed on screen is larger than 0
                result.append(String(numonScreen % 2))      // divide number on screen by 2, add remainder to                                                 result string
                numonScreen = numonScreen/2                 // number on screen is halved
            }
            result = result.reversed()                      // reverse result string
            Display.text = result.joined(separator:"")      // display result
        }
        
        else if sender.tag == 14{                           // if octal button pressed
            while numonScreen > 0 {
                result.append(String(numonScreen % 8))      // divide number on screen by 8, add remainder to                                                 result string
                numonScreen = numonScreen/8
            }
            result = result.reversed()                      // reverse result string
            Display.text = result.joined(separator:"")      // display result
        }
        
        
        else if sender.tag == 15{                           // if hex button pressed
            while numonScreen > 0{
                remainder = numonScreen % 16                // remainder after dividing by 16
                numonScreen = numonScreen/16
                if remainder < 10 {                         // if remainder is less than 10
                    result.append(String(remainder))        // add remainder to result string
                }
                else {
                    switch (remainder){
                    case 10:                                // if remainder is 10 add 'A' to result string
                        result.append("A")
                    case 11:                                // if remainder is 11 add 'B' to result string
                        result.append("B")
                    case 12:                                // if remainder is 12 add 'C' to result string
                        result.append("C")
                    case 13:                                // if remainder is 13 add 'D' to result string
                        result.append("D")
                    case 14:                                // if remainder is 14 add 'E' to result string
                        result.append("E")
                    case 15:                                // if remainder is 15 add 'F' to result string
                        result.append("F")
                    default: break
                        
                    }
                }
            }
            result = result.reversed()                      // reverse result string
            Display.text = result.joined(separator:"")      // display result 
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


