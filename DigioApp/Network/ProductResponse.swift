//
//  ProductResponse.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct ProductResponse: Decodable {
    let name: String
    let imageURL: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageURL = "imageURL"
        case description = "description"
    }
}
