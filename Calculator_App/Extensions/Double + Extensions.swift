//
//  Double + Extensions.swift
//  Calculator_App
//
//  Created by KODDER on 14.10.2022.
//

import Foundation

extension Double {
    
    var stringWithoutZeroFraction: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
