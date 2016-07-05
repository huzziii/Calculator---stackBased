//
//  ViewController.swift
//  Calculator - stackBased
//
//  Created by Huzaifa Asif on 2016-06-27.
//  Copyright © 2016 Huzaifa Asif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var digit:String = "0"
    var rand:String = "0"
    var operandStack = Array<Double>()
    var outputLabel:String = "0" //output to screen
    
     var result:Double = 0
    
    
    var firstLabel:Bool = true

    @IBAction func appendDigit(sender: UIButton) {
        digit = sender.currentTitle!
        rand = label.text!
        
        if (firstLabel){
            label.text = digit
            firstLabel=false
        }
        else{
            
            label.text = rand + digit
        }
    }
    
   
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        switch operation{
            case "×": performOperation(multiply)
            case "÷": performOperation(divide)
            case "+": performOperation(add)
            case "-": performOperation(subtract)
            
        default: break
        }
    }
    
    func performOperation( operation: (Double,Double) -> Double ) {
       
        while (operandStack.count > 1){
            result = operation(operandStack.removeLast(),operandStack.removeLast())
            appending(result)
        }
        outputLabel = String(format: "%0.1f",result)
        label.text = outputLabel
        
    }
    func multiply(op1:Double, op2:Double) -> Double {
        return op1 * op2
    }
    
    func divide(op1:Double, op2:Double) -> Double {
        return op2/op1;
    }
    func add(op1:Double, op2:Double) -> Double {
        return op1+op2;
    }
    func subtract(op1:Double, op2:Double) -> Double {
        return op1-op2;
    }
    
        
 //       switch operand{
    
////            case "×":
////                
////                while (operandStack.count > 1){
////                    result = operandStack.removeLast()*operandStack.removeLast()
////                    appending(result)
////                }
////            
////            case "÷":
////                while (operandStack.count > 1){
////                    result = operandStack.removeFirst()/operandStack.removeFirst()
////                    appending(result)
////                }
//            outputLabel = String(format: "%0.1f",result)
//            label.text = outputLabel
//        
//            default: result = 0
//        }
        
    
    func appending(value:Double){
        operandStack.append(value)
        print("operandStack: \(operandStack)")
        
    }
    
    
    @IBAction func appendToStack() {
        let doubleValue:Double = Double(label.text!)!
        appending(doubleValue)
        clearButton()
       // operandStack.append(doubleValue)
        
    }
    //func appending(stringValue)
    
    @IBAction func clearButton() {
        label.text = ""
    }

}

