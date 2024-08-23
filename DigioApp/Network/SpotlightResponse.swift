//
//  SpotlightResponse.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct SpotlightResponse: Decodable {
    let name: String
    let bannerUrl: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case bannerUrl = "bannerURL"
        case description = "description"
    }
}
