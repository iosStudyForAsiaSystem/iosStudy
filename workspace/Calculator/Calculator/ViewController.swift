//
//  ViewController.swift
//  Calculator
//
//  Created by ASIA-NB-048 on 2017/03/08.
//  Copyright © 2017年 ASIA-NB-048. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var display: UILabel!
    private var userIsInTheMiddleOfTyping = false
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping{
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + digit
        }else{
            display .text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue : Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
    }
    

    
}

