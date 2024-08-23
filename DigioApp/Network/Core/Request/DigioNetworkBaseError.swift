//
//  NetworkBaseError.swift
//  DigioApp
//
//  Created by Marco Marques on 19/08/24.
//

import Foundation

enum DigioNetworkBaseError: Error {
    case invalidURL
    case noData
    case parse
    case badRequest
    case unauthorized
    case clientError
    case unknown
    
}
