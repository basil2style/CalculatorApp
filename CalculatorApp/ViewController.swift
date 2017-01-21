//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Basil on 2017-01-17.
//  Copyright © 2017 Basil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberScreen:Double = 0;        //current number on screen
    var firstNumber:Double = 0;         // previous number on screen
    var firstNumbers:[Double] = [0];
    //var firstOperation:Double = 0;      //tracking first operation
    var mathPerforming = false;         //This is for knowing whether we are performing math operation or not
    var operationVar = 0;
    var value:Double = 0.0;
    var firstOperation = false;
    
    
    
    @IBOutlet weak var label: UILabel!
    //Number button action
    @IBAction func numbers(_ sender: UIButton) {
        if mathPerforming == true{
            label.text = String(sender.tag-1)
            numberScreen = Double(label.text!)!
            mathPerforming = false
           // firstOperation = true
            firstNumber = mathOperation(numberOnScreen: numberScreen,operationVar: operationVar,firstNumber: firstNumber);
            label.text = String(firstNumber)
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
        else if sender.tag == 16 {      //equalto operation
            if firstOperation == true {
                label.text = String(firstNumber)
                //firstOperation = false
            }
            else {
                switch operationVar {       //saved operation symbol
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
       

        }
        else if sender.tag == 11 {      //Clear operation
            label.text = ""
            firstNumber = 0;
            operationVar = 0;
            numberScreen = 0;
        }
    }
   
    func mathOperation(numberOnScreen:Double,operationVar:Int,firstNumber:Double) -> Double {
        switch operationVar {       //saved operation symbol
        
        case 12:     //Divide
            value = firstNumber/numberOnScreen
            break;
        case 13:     //Multiply
            value = numberOnScreen*firstNumber
            break;
        case 14:    //Minus
            value = firstNumber-numberOnScreen
            break;
        case 15:    //Addition
            value = numberOnScreen+firstNumber
            break;
        default :
            break;
            
        }
        return value
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

