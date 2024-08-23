//
//  HomeModel.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct ListHomeModel {
    let spotlight: [SpotlightModel]
    let products: [ProductModel]
    let cash: CashModel
    
    init(spotlight: [SpotlightModel], products: [ProductModel], cash: CashModel) {
        self.spotlight = spotlight
        self.products = products
        self.cash = cash
    }
    
    init(spotlight: [SpotlightResponse], products: [ProductResponse], cash: CashResponse) {
        self.spotlight = spotlight.map { .init(response: $0) }
        self.products = products.map { .init(response: $0)}
        self.cash = .init(response: cash)
    }
}
