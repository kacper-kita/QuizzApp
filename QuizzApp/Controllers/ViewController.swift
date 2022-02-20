//
//  ViewController.swift
//  QuizzApp
//
//  Created by Kacper Kita on 02/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = CategoriesListViewModel()
    
    private lazy var mainView: MainView = {
        let mainView = MainView()
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        getCategories()
    }
    
    private func getCategories() {
        DispatchQueue.main.async {
            self.viewModel.getCategory { _ in
                self.mainView.mainCollectionView.reloadData()
            }
        }
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
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoriesVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainViewCollectionViewCell
        
        let categories = viewModel.categoriesVM[indexPath.row]
        
        cell.categoryVM = categories
        
        return cell
    }
}

