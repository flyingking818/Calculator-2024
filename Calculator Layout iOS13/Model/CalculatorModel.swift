//
//  CalculatorModel.swift
//  Calculator Layout iOS13
//
//  Created by Jeremy Wang on 3/5/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorModel{
    
    //Declare variables/constants at the class level, which are visible by both functions.
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var operation = ""
    
    mutating func performOperation (with newNumber: Double)->Double{
        if operation != "" {
            
            //remove any reference to the UI directly (models don't work with UI directly)
            switch operation{
            case "÷":
                currentNumber = previousNumber/currentNumber
            case "×":
                currentNumber = previousNumber*currentNumber
            case "-":
                currentNumber = previousNumber-currentNumber
            case "+":
                currentNumber = previousNumber+currentNumber
            default:
                break
            }
            return currentNumber
        }
        
        return newNumber
    }
    
    mutating func setOperation(_ newOperation: String) {
        operation = newOperation
        previousNumber = currentNumber
    }
    
    mutating func reset() {
        currentNumber = 0
        previousNumber = 0
        operation = ""
    }
    
    
    
    
}
