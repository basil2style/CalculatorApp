//
//  FileName - ViewController.swift
//  App Name - CalculatorApp
//
//  Student Name: Created by Basil on 2017-01-17.
//  Copyright © 2017 Basil. All rights reserved.
//  This is a Calculator application

import UIKit

class ViewController: UIViewController {
    var numberScreen:Double = 0;        //current number on screen
    var firstNumber:Double = 0;         // previous number on screen
    //var firstNumbers:[Double] = [0];
    //var firstOperation:Double = 0;      //tracking first operation
    var mathPerforming = false;         //This is for knowing whether we are performing math operation or not
    var operationVar = 0;               //For setting operator symbol number
    var value:Double = 0.0;              //Temporary variable
    var firstOperation = true;
    var pressedOperator = false;        //decimal pt
    var userInMiddleOperation = false;
    
    
    
    @IBOutlet weak var label: UILabel!          //label variable
    //Number button action
    @IBAction func numbers(_ sender: UIButton) {
        if sender.tag != 17 {               //Check its not decimal point
            if mathPerforming == true {
                label.text = String(sender.tag-1)
                numberScreen = Double(label.text!)!
               // mathPerforming = false
                // firstOperation = true
                //  firstNumber = mathOperation(numberOnScreen: numberScreen,operationVar: operationVar,firstNumber: firstNumber);
                updateDisplay(numberScreen:numberScreen)
                
            }
            else{
                //  label.text = label.text! + String(sender.tag-1)
              //  print("Label text \(label.text)")
              //  print("Sender.tag-1 \(sender.tag-1)")
                numberScreen = Double(label.text! + String(sender.tag-1))!
                updateDisplay(numberScreen: numberScreen)
             //   print("First Operation")
            }
        }
      
        if sender.tag == 17 {           //check if its decimal point
            if pressedOperator == false {       //first time
                var tesVar = Int64(numberScreen)
                if numberScreen - Double(tesVar) == 0 {
                   // print(numberScreen)
                     label.text =  "\(tesVar)"+"."
                    }
               
                pressedOperator = true
            }
            else {                              //
                //label.text =  "\(numberScreen)"
                updateDisplay(numberScreen: numberScreen)
            }
        }
       
    }
    //Refresh display label,if numberScreen is Int,then it will display it.
    func updateDisplay(numberScreen:Double){
        self.numberScreen = numberScreen
        var iAcc = Int64(numberScreen)
        if numberScreen - Double(iAcc) == 0 {
        label.text = String(iAcc)
        }
        else {
        label.text = String(numberScreen)
        }
        
        
    }
  
    //Button operation
    @IBAction func operatorBtn(_ sender: UIButton) {
        pressedOperator = false
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            if mathPerforming == true {
               // print(operationVar)
                firstNumber = mathOperation(numberOnScreen: numberScreen,operationVar: operationVar,firstNumber: firstNumber);
                print("Inside mathperforming = true")
             //   mathPerforming = false
              //  print("mathPerforming \(mathPerforming)")
            }
            else {
                firstNumber = Double(label.text!)!
                //firstNumbers.append(Double(label.text!)!)
                mathPerforming = true
              // print("mathPerforming \(mathPerforming)")
                
            }
            switch sender.tag {
            case 12:     //Divide
                label.text = "/"
                //mathPerforming = true
                break;
            case 13:     //Multiply
                label.text = "*"
                //mathPerforming = true
                break;
            case 14:    //Minus
                label.text = "-"
                //mathPerforming = true
                break;
            case 15:    //Addition
                label.text = "+"
              //  mathPerforming = true
                break;
            case 18:
                value = Double(numberScreen * -1)
                updateDisplay(numberScreen: value)
               // label.text = String(value)
                mathPerforming = false
                break;
            case 19:
                label.text = String(firstNumber.truncatingRemainder(dividingBy: numberScreen))
                //mathPerforming = true
                break;
            default :
                break;
            
            }
            if sender.tag != 18 {
            operationVar = sender.tag
            }
            
          //  mathPerforming = true;
          //  print("mathPerforming \(mathPerforming)")

        }
        else if sender.tag == 16 {      //equalto operation
           // mathPerforming = false
            if firstOperation == false {
                label.text = String(firstNumber)
                //firstOperation = false
                updateDisplay(numberScreen: firstNumber)
            }
            else {
                print("OperationVar:\(operationVar)")
                print("firsttNumber:\(firstNumber)")
                print("NumberonScreen:\(numberScreen)")
                switch operationVar {       //saved operation symbol
                    
                case 12:     //Divide
                    mathPerforming = false
                    value = Double(firstNumber/numberScreen)
                    updateDisplay(numberScreen: value)
                    break;
                case 13:     //Multiply
                    mathPerforming = false
                    value = Double(numberScreen*firstNumber)
                    updateDisplay(numberScreen: value)
                    break;
                case 14:    //Minus
                    mathPerforming = false
                    value = Double(firstNumber-numberScreen)
                    updateDisplay(numberScreen: value)
                    break;
                case 15:    //Addition
                    mathPerforming = false
                    value = Double(numberScreen+firstNumber)
                    updateDisplay(numberScreen: value)
                    break;
                default :
                    break;
                    
                }
            }
       

        }
        else if sender.tag == 11 {      //Clear operation
            label.text = "0"
            firstNumber = 0;
            operationVar = 0;
            numberScreen = 0;
            mathPerforming = false
            firstOperation = true
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

