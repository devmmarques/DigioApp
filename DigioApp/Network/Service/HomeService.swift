//
//  HomeService.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

protocol HomeServiceProtocol {
    func fetch(completion: @escaping(Result<HomeResponse, DigioNetworkBaseError>) -> Void)
}

final class HomeService: HomeServiceProtocol {
    
    private let service: DigioBaseServiceProtocol
    
    init(service: DigioBaseServiceProtocol) {
        self.service = service
    }
    
    func fetch(completion: @escaping (Result<HomeResponse, DigioNetworkBaseError>) -> Void) {
        let request = HomeRequest()
        
        service.fetch(request: request, model: HomeResponse.self) { (result: Result<HomeResponse, DigioNetworkBaseError>) in
           switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
}
