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
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        label.text = label.text! + String(sender.tag-1)
        numberScreen = Double(label.text!)!
    }
    
    @IBAction func operatorBtn(_ sender: UIButton) {
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

