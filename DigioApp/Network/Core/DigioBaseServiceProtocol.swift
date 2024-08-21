//
//  NetworkBaseServiceProtocol.swift
//  DigioApp
//
//  Created by Marco Marques on 19/08/24.
//

import Foundation

protocol DigioBaseServiceProtocol {
    func fetch<T: Decodable>(request: RequestProtocol, model: T.Type, completion: @escaping (Result<T, DigioNetworkBaseError>) -> Void)
}
