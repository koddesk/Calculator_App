//
//  UIStackView + Extensions.swift
//  Calculator_App
//
//  Created by KODDER on 06.10.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
}
