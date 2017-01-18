//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Basil on 2017-01-17.
//  Copyright © 2017 Basil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberScreen:Double = 0;
    var firstNumber:Double = 0;
    var mathPerforming = false;
    
    
    
    
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        if mathPerforming == true{
            label.text = String(sender.tag-1)
        }
        label.text = label.text! + String(sender.tag-1)
        numberScreen = Double(label.text!)!
    }
    
    @IBAction func operatorBtn(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            switch sender.tag {
            case 12:     //Divide
                break;
            case 13:     //Multiply
                break;
            case 14:    //Minus
                break;
            case 15:    //Addition
                label.text = "+"
                break;
            default :
                break;
            
            }
            mathPerforming = true;
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

