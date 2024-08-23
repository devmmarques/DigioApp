//
//  HomeDetailCoordinator.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

protocol HomeDetailCoordinatorProtocol: AnyObject {
    func openDetail(model: HomeDetailModel)
    func closedView()
}

class HomeDetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() { }
}

extension HomeDetailCoordinator: HomeDetailCoordinatorProtocol {
    
    func openDetail(model: HomeDetailModel) {
        let viewModel = HomeDetailViewModel(model: model, coordinator: self)
        let homeDetailViewController = HomeDetailViewController(viewModel: viewModel,
                                                                homeView: HomeDetailView())
        navigationController.present(homeDetailViewController, animated: true)
    }
    
    func closedView() {
        navigationController.dismiss(animated: true)
    }
}
