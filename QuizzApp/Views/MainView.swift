//
//  MainView.swift
//  QuizzApp
//
//  Created by Kacper Kita on 12/02/2022.
//

import Foundation
import UIKit

final class MainView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Let's Play"
        label.font = UIFont(name: "Arial Bold", size: 32)
        label.textColor = UIColor(named: "titleLabel")
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Chose your language"
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = .gray
        
        return label
    }()
    
    public lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectonView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = CGSize(width: 0, height: 30)
        layout.minimumLineSpacing = 50
        collectonView.translatesAutoresizingMaskIntoConstraints = false
        collectonView.register(MainViewCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectonView.showsVerticalScrollIndicator = false
        
        return collectonView
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
        addSubview(subTitleLabel)
        addSubview(mainCollectionView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            titleLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30),
            mainCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            mainCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            mainCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
