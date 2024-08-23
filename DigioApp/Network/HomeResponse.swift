//
//  HomeResponse.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct HomeResponse: Decodable {
    let spotlight: [SpotlightResponse]
    let products: [ProductResponse]
    let cash: CashResponse
    
    enum CodingKeys: String, CodingKey {
        case spotlight = "spotlight"
        case products = "products"
        case cash = "cash"
    }
}
