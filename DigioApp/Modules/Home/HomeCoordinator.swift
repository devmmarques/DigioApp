//
//  HomeCoordinator.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol HomeCoordinatorProtocol {
    func openDetailView(model: HomeDetailModel)
    func openRechargeDetail(model: RechargeDetailModel)
}

class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    func start() {
        let homeViewModel = HomeViewModel(service: HomeService(service: DigioBaseService()))
        let homeView = HomeView()
        let homeViewController = HomeViewController(viewModel: homeViewModel,
                                                  homeView: homeView, coordinator: self)
        navigation.pushViewController(homeViewController, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func openDetailView(model: HomeDetailModel) {
        let coordinator = HomeDetailCoordinator(navigationController: self.navigation)
        childCoordinators.append(coordinator)
        coordinator.openDetail(model: model)
    }
    
    func openRechargeDetail(model: RechargeDetailModel) {
        let coordinator = RechargeDetailCoordinator(navigationController: self.navigation)
        childCoordinators.append(coordinator)
        coordinator.openDetail(model: model)
    }
    
}
