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
        
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        } else if number == 0 && currentNumber == "0" {
            currentNumber.removeLast()
        }
        currentNumber.append(String(number))
    }
    
    public func getCurrentNumber() -> String {
        currentNumber
    }
    
    //MARK: Set Operation
    public func setOperation(operation: Operations) -> String {
        
        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else {return ""}
            firstNumber = number
        } else {
            guard let result = Double(getResult()) else {return ""}
            firstNumber = result
        }
        currentNumber = ""
        currentOperation = operation
        return firstNumber.stringWithoutZeroFraction
    }
    
    public func getResult() -> String {
        guard let number = Double(currentNumber) else {return ""}
        secondNumber = number
        
        switch currentOperation {
        case .noAction:
            print("noAction")
            return ""
        case .addition:
            return (firstNumber + secondNumber).stringWithoutZeroFraction
        case .subtraction:
            return (firstNumber - secondNumber).stringWithoutZeroFraction
        case .multiplication:
            return (firstNumber * secondNumber).stringWithoutZeroFraction
        case .division:
            if secondNumber == 0 {
                return "Не определено"
            } else {
                return (firstNumber / secondNumber).stringWithoutZeroFraction
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
    
    //MARK: Percent
    public func setPercentNumber() {
        guard let number = Double(currentNumber) else {return}
        
        if firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
