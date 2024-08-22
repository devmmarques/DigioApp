//
//  HomeViewModel.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewControllerProtocol? { get set }
    func fetchHome()
}

class HomeViewModel {
    
    var service: HomeServiceProtocol
    var homeModel: ListHomeModel?
    weak var delegate: HomeViewControllerProtocol?
    
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
                let homeModel = ListHomeModel(spotlight: data.spotlight, products: data.products, cash: data.cash)
                delegate?.update(model: homeModel)
            case .failure(let error):
                print(error)
            }
        }
    }
}
