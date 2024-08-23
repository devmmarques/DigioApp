//
//  Cash.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct CashModel {
    let title: String
    let bannerUrl: String
    let description: String
    
    init(title: String, bannerUrl: String, description: String) {
        self.title = title
        self.bannerUrl = bannerUrl
        self.description = description
    }
    
    init(response: CashResponse) {
        self.title = response.title
        self.bannerUrl = response.bannerUrl
        self.description = response.description
    }
}
