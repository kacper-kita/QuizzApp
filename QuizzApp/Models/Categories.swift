//
//  Categories.swift
//  QuizzApp
//
//  Created by Kacper Kita on 12/02/2022.
//

import Foundation

struct Category: Decodable {
    let id: Int
    let name: String
    let image: String?
    let category_url: String
    let color: String?
    let description: String?
}
