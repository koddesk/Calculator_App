//
//  String + Extensions.swift
//  Calculator_App
//
//  Created by KODDER on 14.10.2022.
//

import Foundation

extension String {
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
