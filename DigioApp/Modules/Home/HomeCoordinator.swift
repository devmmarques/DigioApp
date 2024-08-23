//
//  HomeCoordinator.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol HomeCoordinatorProtocol: AnyObject {
    func openDetailView(model: HomeDetailModel)
    func openRechargeDetail(model: RechargeDetailModel)
    func showAlert(alert: AlertViewModel)
}

class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    func start() {
        let homeViewModel = HomeViewModel(service: HomeService(service: DigioBaseService()))
        let homeView = HomeView()
        let homeViewController = HomeViewController(viewModel: homeViewModel,
                                                  homeView: homeView, coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func openDetailView(model: HomeDetailModel) {
        let coordinator = HomeDetailCoordinator(navigationController: self.navigationController)
        childCoordinators.append(coordinator)
        coordinator.openDetail(model: model)
    }
    
    func openRechargeDetail(model: RechargeDetailModel) {
        let coordinator = RechargeDetailCoordinator(navigationController: self.navigationController)
        childCoordinators.append(coordinator)
        coordinator.openDetail(model: model)
    }
    
    func showAlert(alert: AlertViewModel) {
        let alert = DigioAlertViewController(alert: alert)
        navigationController.present(alert, animated: true)
    }
    
}
