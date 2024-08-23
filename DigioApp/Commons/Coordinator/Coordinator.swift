//
//  Coordinator.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
