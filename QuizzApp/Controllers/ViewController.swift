//
//  ViewController.swift
//  QuizzApp
//
//  Created by Kacper Kita on 02/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var mainView: MainView = {
        let mainView = MainView()
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(mainView)
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

}

