//
//  NetworkBaseService.swift
//  DigioApp
//
//  Created by Marco Marques on 19/08/24.
//

import Foundation

class DigioBaseService: DigioBaseServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T: Codable>(request: RequestProtocol, model: T.Type, completion: @escaping (Result<T, DigioNetworkBaseError>) -> Void) {
        
        let urlRequest = request.asURLRequest()
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(DigioNetworkBaseError.invalidURL))
                return
            }
            
            guard let data = data else {
                completion(.failure(DigioNetworkBaseError.noData))
                return
            }
            
            do {
                let decodedModel = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedModel))
            } catch {
                completion(.failure(DigioNetworkBaseError.parse))
            }
        }
        task.resume()
    }
    
}
