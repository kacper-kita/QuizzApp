//
//  QuizViewController.swift
//  QuizzApp
//
//  Created by Kacper Kita on 23/02/2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    private lazy var quizView: UIView = {
        let quizView = QuizView()
        return quizView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(quizView)
        view.backgroundColor = UIColor(named: "QuizBackground")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            quizView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quizView.topAnchor.constraint(equalTo: view.topAnchor),
            quizView.rightAnchor.constraint(equalTo: view.rightAnchor),
            quizView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
