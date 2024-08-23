//
//  HomeViewModelMock.swift
//  DigioAppTests
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation
@testable import DigioApp

class HomeViewModelMock: HomeViewModelProtocol {
    
    var delegate: HomeViewControllerProtocol?
        var coordinator: HomeCoordinatorProtocol?

        var fetchHomeCalled = false
        var didOpenProductDetailCalled = false
        var didOpenRechargeDetailCalled = false
        var didOpenCashDetailCalled = false

        var mockHomeResponse: HomeResponse?
        var mockProductModel: ProductModel?
        var mockSpotlightModel: SpotlightModel?
        var mockCashModel: CashModel?

        func fetchHome() {
            fetchHomeCalled = true
            if let response = mockHomeResponse {
                let model = ListHomeModel(spotlight: response.spotlight,
                                          products: response.products,
                                          cash: response.cash)
                delegate?.update(model: model)
            } else {
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

        func didOpenProductDetail(model: ProductModel) {
            didOpenProductDetailCalled = true
            coordinator?.openDetailView(model: .init(title: model.name, imageURL: model.imageURL, description: model.description))
        }

        func didOpenRechargeDetail(model: SpotlightModel) {
            didOpenRechargeDetailCalled = true
            coordinator?.openRechargeDetail(model: .init(title: model.name, imageURL: model.bannerUrl, description: model.description))
        }

        func didOpenCashDetail(model: CashModel) {
            didOpenCashDetailCalled = true
            coordinator?.openDetailView(model: .init(title: model.title, imageURL: model.bannerUrl, description: model.description))
        }
    
}
