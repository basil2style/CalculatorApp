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
    var firstNumbers:[Double] = [0];
    var mathPerforming = false;
    var operationVar = 0;
    
    
    
    
    @IBOutlet weak var label: UILabel!
    //Number button action
    @IBAction func numbers(_ sender: UIButton) {
        if mathPerforming == true{
            label.text = String(sender.tag-1)
            numberScreen = Double(label.text!)!
            mathPerforming = false
        }
        else{
            label.text = label.text! + String(sender.tag-1)
            numberScreen = Double(label.text!)!
        }
       
    }
    //Button operation
    @IBAction func operatorBtn(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            firstNumber = Double(label.text!)!
            firstNumbers.append(Double(label.text!)!)
            switch sender.tag {
            case 12:     //Divide
                label.text = "/"
                break;
            case 13:     //Multiply
                label.text = "*"
                break;
            case 14:    //Minus
                label.text = "-"
                break;
            case 15:    //Addition
                label.text = "+"
                break;
            default :
                break;
            
            }
            operationVar = sender.tag
            mathPerforming = true;
        }
        else if sender.tag == 16 {
            switch operationVar {
            case 12:     //Divide
                label.text = String(numberScreen/firstNumber)
                break;
            case 13:     //Multiply
                label.text = String(numberScreen*firstNumber)
                break;
            case 14:    //Minus
                label.text = String(firstNumber-numberScreen)
                break;
            case 15:    //Addition
                label.text = String(numberScreen+firstNumber)
                break;
            default :
                break;
                
            }

        }
        else if sender.tag == 11 {
            label.text = "0"
            firstNumber = 0;
            operationVar = 0;
            numberScreen = 0;
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

