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
    private var currentHistory = ""
    
    private func setInvertHistoryValue() {
        guard let number = Double(currentNumber) else {return}
        
        switch number {
        case ..<0:
            let index = currentHistory.index(currentHistory.endIndex, offsetBy: -2)
            currentHistory.remove(at: index)
        case 0: break
        case 0...:
            let index = currentHistory.index(before: currentHistory.endIndex)
            currentHistory.insert("-", at: index)
        default:
            print("Invert history error")
        }
    }
    
    public func getCalculationHistory(tag: Int) -> String {
        switch tag {
        case 0...9:
            currentHistory += "\(tag)"
        case 10:
            if !currentNumber.contains(",") {
                currentHistory += ","
            }
        case 12...15:
            currentHistory += currentOperation.rawValue
        case 17:
            setInvertHistoryValue()
        default:
            print("Error history tag")
        }
        return currentHistory
    }
    
    public func setNumber(number: Int) {
        
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        } else if number == 0 && currentNumber == "0" {
            currentNumber.removeLast()
        }
        currentNumber.append(String(number))
    }
    
    public func getCurrentNumber() -> String {
        currentNumber.stringWithoutPoint
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
        return firstNumber.stringWithoutZeroFraction.stringWithoutPoint
    }
    
    public func getResult() -> String {
        guard let number = Double(currentNumber) else {return ""}
        secondNumber = number
        
        var result = 0.0
        
        switch currentOperation {
        case .noAction:
            return currentNumber
        case .addition:
            result = firstNumber + secondNumber
        case .subtraction:
            result = firstNumber - secondNumber
        case .multiplication:
            result = firstNumber * secondNumber
        case .division:
            if secondNumber == 0 {
                return "Не определено"
            } else {
                result = firstNumber / secondNumber
            }
        }
        return result.stringWithoutZeroFraction.stringWithoutPoint
    }
    
    //MARK: Reset
    public func resetValues() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = .noAction
        currentHistory = ""
    }
    
    //MARK: Plus / Minus
    public func invertValue() {
        guard let number = Double(currentNumber) else {
            currentNumber = "0"
            return
        }
        
        switch number {
        case ..<0:
            currentNumber.remove(at: currentNumber.startIndex)
        case 0: break
        case 0...:
            currentNumber.insert("-", at: currentNumber.startIndex)
        default:
            print("Error invert value")
        }
    }
    
    public func addPointValue() {
        if !currentNumber.contains(",") {
            currentNumber += currentNumber != "" ? "," : "0,"
        }
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
