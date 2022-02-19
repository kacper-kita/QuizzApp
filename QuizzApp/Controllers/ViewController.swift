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
        
        mainView.mainCollectionView.dataSource = self
        mainView.mainCollectionView.delegate = self
        
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
}

