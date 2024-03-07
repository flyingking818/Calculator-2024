//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.


//  Enhanced by Jeremy Wang on 2/27/2024
//  Added the basic math functionality to the calculator

import UIKit

class ViewController: UIViewController {
    
    
    
    //Add IBOutlets
    
    @IBOutlet weak var displayLabel: UILabel!
    
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Model instantiation
    var performingMath = false
    var model  = CalculatorModel()  //This instantiate the model object based on the struct.
    
    //The number group method/function
    @IBAction func numberButtons(_ sender: UIButton) {
        //we need to check for the performingMath flag to do different processing for the number group
        if performingMath == true {
            // the .title property gives us the face value of the button pressed. The "normal" means the default state.
            displayLabel.text = sender.title(for: .normal)
            model.currentNumber  = Double(displayLabel.text!)!
            performingMath = false
        }
        else{
            //Clear the initial 0
            if displayLabel.text == "0"
            {
                displayLabel.text = ""
            }
            //Use string concatenation to build your number string
            displayLabel.text = displayLabel.text! + sender.title(for: .normal)!
            model.currentNumber = Double(displayLabel.text!)!
        }
        
    }
    
    //The operator group method/function
    
    @IBAction func operatorButtons(_ sender: UIButton) {
        
        if let operation = sender.title(for: .normal) {
            switch operation {
            case "=","AC":
                if operation == "=" {
                    let result = model.performOperation(with: model.currentNumber)
                    displayLabel.text = String(result)
                    performingMath = true
                }else if operation == "AC"{
                    model.reset()
                    displayLabel.text = "0"
                }
                //hint: You can add the other operators here by using else if...
                //add your codes to use the other operators
                else {
                    displayLabel.text = "0"
                }
            default:  //This would be the main operators (+, -, /, *)
                model.setOperation(operation)
                performingMath = true
            }
        }
        
    }
    
    
    
}

