//
//  CashResponse.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct CashResponse: Decodable {
    let title: String
    let bannerUrl: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case bannerUrl = "bannerURL"
        case description = "description"
    }
}
