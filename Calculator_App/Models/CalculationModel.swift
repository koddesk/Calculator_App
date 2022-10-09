//
//  CalculationModel.swift
//  Calculator_App
//
//  Created by KODDER on 08.10.2022.
//

import UIKit

class CalculationModel {
    
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = Operations.noAction
    
    public func setNumber(number: Int) {
        currentNumber.append(String(number))
    }
    
    public func getCurrentNumber() -> String {
        currentNumber
    }
    
    //MARK: Set Operation
    public func setOperation(operation: Operations) {
        guard let number = Double(currentNumber) else {return}
        firstNumber = number
        currentNumber = ""
        currentOperation = operation
    }
    
    public func getResult() -> String {
        guard let number = Double(currentNumber) else {return ""}
        secondNumber = number
        
        switch currentOperation {
        case .noAction:
            print("noAction")
            return ""
        case .addition:
            return String(firstNumber + secondNumber)
        case .subtraction:
            return String(firstNumber - secondNumber)
        case .multiplication:
            return String(firstNumber * secondNumber)
        case .division:
            if secondNumber == 0 {
                return "Не определено"
            } else {
                return String(firstNumber / secondNumber)
            }
        }
    }
    
    //MARK: Reset
    public func resetValues() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = .noAction
    }
    
    //MARK: Plus / Minus
    public func invertValue() {
        guard let number = Double(currentNumber) else {return}
        
        if number > 0 {
            currentNumber.insert("-", at: currentNumber.startIndex)
        } else {
            currentNumber.remove(at: currentNumber.startIndex)
        }
    }
    
    public func addPointValue() {
        currentNumber += currentNumber != "" ? "." : "0."
    }
    
    public func setPercentNumber() {
        guard let number = Double(currentNumber) else {return}
        
        if firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
