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
    
    func fetch<T: Decodable>(request: RequestProtocol, model: T.Type, completion: @escaping (Result<T, DigioNetworkBaseError>) -> Void) {
        
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
                DispatchQueue.main.async {
                    completion(.success(decodedModel))
                }
                
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(DigioNetworkBaseError.parse))
                }
            }
        }
        task.resume()
    }
    
    func fetchData(request: RequestProtocol, completion: @escaping (Result<Data, any Error>) -> Void) {
        let urlRequest = request.asURLRequest()
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                completion(.failure(error ?? DigioNetworkBaseError.badRequest))
                return
            }
            
            guard let data = data else {
                completion(.failure(DigioNetworkBaseError.noData))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
