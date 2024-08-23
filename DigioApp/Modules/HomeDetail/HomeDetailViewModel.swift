//
//  HomeDetailViewModel.swift
//  DigioApp
//
//  Created by Marco Marques on 22/08/24.
//

import Foundation

protocol HomeDetailViewModelProtocol: AnyObject {
    var delegate: HomeDetailViewControllerProtocol? { get set }
    func getDetail() -> HomeDetailModel
    func closedView()
}

class HomeDetailViewModel: HomeDetailViewModelProtocol {
    
    private(set) var model: HomeDetailModel
    weak var delegate: HomeDetailViewControllerProtocol?
    var coordinator: HomeDetailCoordinatorProtocol
    
    init(model: HomeDetailModel, coordinator: HomeDetailCoordinatorProtocol) {
        self.model = model
        self.coordinator = coordinator
    }
    
    func getDetail() -> HomeDetailModel {
        return model
    }
    
    func closedView() {
        self.coordinator.closedView()
    }
}
