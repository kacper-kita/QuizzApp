//
//  MainViewCollectionViewCell.swift
//  QuizzApp
//
//  Created by Kacper Kita on 19/02/2022.
//

import UIKit

class MainViewCollectionViewCell: UICollectionViewCell {
     lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Arial Bold", size: 25)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "play.square", withConfiguration: UIImage.SymbolConfiguration(pointSize: 42))?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
 
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) ERROR")
    }
    
    private func setupView() {
        addSubview(categoryLabel)
        addSubview(playButton)
        layer.cornerRadius = 15.0
        backgroundColor = UIColor(named: "CellCollor")

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryLabel.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            playButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
        ])
    }
}
