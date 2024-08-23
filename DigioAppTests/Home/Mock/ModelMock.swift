//
//  ModelMock.swift
//  DigioAppTests
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation
@testable import DigioApp

struct ModelMock {
    
    static let spotlight = SpotlightModel(name: "Spotlight 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    static let products = ProductModel(name: "Product 1", imageURL: "https://www.digio.com.br/", description: "desc1")
    static let cash = CashModel(title: "Cash 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    
    static let listHome = ListHomeModel(spotlight: [spotlight], products: [products], cash: cash)
    
    
    static let spotlightResponse = SpotlightResponse(name: "Spotlight 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    static let productResponse = ProductResponse(name: "Product 1", imageURL: "https://www.digio.com.br/", description: "desc1")
    static let cashResponse = CashResponse(title: "Cash 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    
    static let homeResponse = HomeResponse(spotlight: [spotlightResponse], products: [productResponse], cash: cashResponse)
    
    
}
