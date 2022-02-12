//
//  CategoriesViewModel.swift
//  QuizzApp
//
//  Created by Kacper Kita on 12/02/2022.
//

import Foundation

struct CategoriesViewModel {
    let categories: Category
    
    var name: String {
        return categories.name 
    }
    
    var image: String {
        return categories.image ?? "https://www.kindpng.com/imgv/wmbbow_mono-metacontact-unknown-clip-arts-unknown-clipart-hd/"
    }
    
    var category_url: String {
        return categories.category_url 
    }
    
    var color: String {
        return categories.color ?? "#8f8f8f"
    }
    
    var description: String {
        return categories.description ?? "Unknown"
    }
}
