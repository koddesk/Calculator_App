//
//  MainViewController.swift
//  Calculator_App
//
//  Created by KODDER on 06.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let mainStackView = MainStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(mainStackView)
    }
}

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1)
        ])
    }
}
