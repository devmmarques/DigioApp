//
//  Product.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct ProductModel {
    let name: String
    let imageURL: String
    let description: String
    
    init(name: String, imageURL: String, description: String) {
        self.name = name
        self.imageURL = imageURL
        self.description = description
    }
    
    init(response: ProductResponse) {
        self.name = response.name
        self.imageURL = response.imageURL
        self.description = response.description
    }
}
