//
//  CategoriesListViewModel.swift
//  QuizzApp
//
//  Created by Kacper Kita on 12/02/2022.
//

import Foundation

class CategoriesListViewModel {
    var categoriesVM = [CategoriesViewModel]()
    
    func getCategory(completion: @escaping ([CategoriesViewModel]) -> Void) {
        NetworkManager.shared.getCategories { categories in
            guard let categories = categories else {
                return
            }
            
            let categoriesVM = categories.map(CategoriesViewModel.init)
            DispatchQueue.main.async {
                self.categoriesVM = categoriesVM
                completion(categoriesVM)
            }
        }
    }
}
