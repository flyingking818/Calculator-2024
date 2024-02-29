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
    
    //Declare variables/constants at the class level, which are visible by both functions.
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = ""
    
    
    //Add IBOutlets
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //The number group method/function
    @IBAction func numberButtons(_ sender: UIButton) {
        //we need to check for the performingMath flag to do different processing for the number group
        if performingMath == true {
            // the .title property gives us the face value of the button pressed. The "normal" means the default state.
            displayLabel.text = sender.title(for: .normal)
            currentNumber = Double(displayLabel.text!)!
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
            currentNumber = Double(displayLabel.text!)!
        }
        
    }
    
    //The operator group method/function
    
    @IBAction func operatorButtons(_ sender: UIButton) {
        
        if displayLabel.text != "" && sender.title(for: .normal) != "=" && sender.title(for: .normal) != "AC" {
            previousNumber = Double(displayLabel.text!)!
            operation = sender.title(for: .normal)!  //this will be + - / *
            performingMath = true
        }
        else if sender.title(for: .normal) == "=" {
            //Try the if..else if decision making structure
            
            switch operation{
            case "÷":
                displayLabel.text = String(previousNumber/currentNumber)
            case "×":
                displayLabel.text = String(previousNumber*currentNumber)
            case "-":
                displayLabel.text = String(previousNumber-currentNumber)
            case "+":
                displayLabel.text = String(previousNumber+currentNumber)
            default:
                break
            }
            performingMath = false
        }
        else if sender.title(for: .normal) == "AC" {
            displayLabel.text = "0"
            previousNumber = 0
            currentNumber = 0
            operation = ""
            performingMath = false
            
        }
        
    }
    
    
    
}

