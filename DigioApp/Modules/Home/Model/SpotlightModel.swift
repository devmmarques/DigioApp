//
//  Spotlight.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct SpotlightModel {
    let name: String
    let bannerUrl: String
    let description: String
    
    init(name: String, bannerUrl: String, description: String) {
        self.name = name
        self.bannerUrl = bannerUrl
        self.description = description
    }
    
    init(response: SpotlightResponse) {
        self.name = response.name
        self.bannerUrl = response.bannerUrl
        self.description = response.description
    }
}
