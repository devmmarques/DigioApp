//
//  HomeViewModel.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    var delegate: HomeViewControllerProtocol? { get set }
    var coordinator: HomeCoordinatorProtocol? { get set }
    func fetchHome()
    func didOpenProductDetail(model: ProductModel)
    func didOpenRechargeDetail(model: SpotlightModel)
    func didOpenCashDetail(model: CashModel)
}

class HomeViewModel {
    
    var service: HomeServiceProtocol
    var homeModel: ListHomeModel?
    weak var delegate: HomeViewControllerProtocol?
    var coordinator: HomeCoordinatorProtocol?
    
    init(service: HomeServiceProtocol, coordinator: HomeCoordinatorProtocol?) {
        self.service = service
        self.coordinator = coordinator
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
                coordinator?.showAlert(alert: .init(status: .error,
                                                    title: "Erro ao carregar",
                                                    description: "Não foi possível carregar os dados \n Deseja tentar novamente ?",
                                                    titlePrimaryButton: "Sim",
                                                    titleSecondaryButton: "Não",
                                                    actionPrimaryButton: { [weak self] in
                    self?.fetchHome()
                },
                                                    actionSecondaryButton: { [weak self] in
                    self?.coordinator?.closedView()
                }))
            }
        }
    }
    
    func didOpenProductDetail(model: ProductModel) {
        coordinator?.openRechargeDetail(model: .init(title: model.name,
                                                     imageURL: model.imageURL,
                                                     description: model.description,
                                                     isFull: false))
    }
    
    func didOpenRechargeDetail(model: SpotlightModel) {
        coordinator?.openRechargeDetail(model: .init(title: model.name,
                                                     imageURL: model.bannerUrl,
                                                     description: model.description,
                                                     isFull: false))
    }
    
    func didOpenCashDetail(model: CashModel) {
        coordinator?.openDetailView(model: .init(title: model.title,
                                                 imageURL: model.bannerUrl,
                                                 description: model.description))
    }
}
