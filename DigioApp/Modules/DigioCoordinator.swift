//
//  DigioCoordinator.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import Foundation
import UIKit

class DigioCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    let window: UIWindow
    let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigation: self.navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
}
