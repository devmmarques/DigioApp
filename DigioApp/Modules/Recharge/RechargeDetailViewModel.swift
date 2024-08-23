//
//  RechargeDetailViewModel.swift
//  DigioApp
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation

protocol RechargeDetailViewModelProtocol: AnyObject {
    var delegate: RechargeDetailViewControllerProtocol? { get set }
    func getDetail() -> RechargeDetailModel
    func didTapContinue()
}

class RechargeDetailViewModel: RechargeDetailViewModelProtocol {
    
    private(set) var model: RechargeDetailModel
    internal weak var delegate: RechargeDetailViewControllerProtocol?
    private var coordinator: RechargeDetailCoordinatorProtocol
    
    init(model: RechargeDetailModel, coordinator: RechargeDetailCoordinatorProtocol) {
        self.model = model
        self.coordinator = coordinator
    }
    
    func getDetail() -> RechargeDetailModel {
        return model
    }
    
    func didTapContinue() {
        self.coordinator.showAlert(alert: .init(status: .success,
                                            title: "Recarga \(model.title) realizada com sucesso",
                                            description: "Parábens ! Você acaba de adicionar um saldo \(model.title) \n\n Aproveite ao máximo e continue usufluindo dos nossos serviços.",
                                            titlePrimaryButton: "OK",
                                            titleSecondaryButton: nil,
                                            actionPrimaryButton: { [weak self] in
            self?.coordinator.closedView()
        },
                                            actionSecondaryButton: nil))
    }
}
