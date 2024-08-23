//
//  HomeDetailCoordinator.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import UIKit

final class HomeDetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func openDetail(model: HomeDetailModel) {
        let viewModel = HomeDetailViewModel(model: model)
        let homeDetailViewController = HomeDetailViewController(viewModel: viewModel, homeView: HomeDetailView())
        navigationController.present(homeDetailViewController, animated: true)
    }
    
    
    func closedView() {
        navigationController.popViewController(animated: true)
    }
}
