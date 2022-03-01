//
//  QuizView.swift
//  QuizzApp
//
//  Created by Kacper Kita on 23/02/2022.
//

import Foundation
import UIKit

final class QuizView: UIView {
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "siema"
        
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) ERROR")
    }
    
    private func setupView() {
        addSubview(titleLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            titleLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}
