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
        let rechargeDetailViewController = RechargeDetailViewController(coordinator: self, viewModel: viewModel, rechargeView: RechargeDetailView())
        navigationController.pushViewController(rechargeDetailViewController, animated: true)
    }
    
    
    func closedView() {
        navigationController.dismiss(animated: true)
    }
    
    func showAlert(alert: AlertViewModel) {
        
        let alert = DigioAlertViewController(alert: alert)
        self.navigationController.present(alert, animated: true)
    }
}
