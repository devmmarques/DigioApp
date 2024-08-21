//
//  HomeViewModel.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func fetchHome()
}

class HomeViewModel {
    
    var service: HomeServiceProtocol
    var homeModel: HomeModel?
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func fetchHome() {
        service.fetch { [weak self] (result: Result<HomeResponse, DigioNetworkBaseError>) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
