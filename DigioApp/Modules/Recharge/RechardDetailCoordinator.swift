//
//  RechardDetailCoordinator.swift
//  DigioApp
//
//  Created by Marco Marques on 23/08/24.
//


import UIKit

final class RechargeDetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func openDetail(model: RechargeDetailModel) {
        let viewModel = RechargeDetailViewModel(model: model)
        let RechargeDetailViewController = RechargeDetailViewController(viewModel: viewModel, rechargeView: RechargeDetailView())
        navigationController.present(RechargeDetailViewController, animated: true)
    }
    
    
    func closedView() {
        navigationController.dismiss(animated: true)
    }
}
