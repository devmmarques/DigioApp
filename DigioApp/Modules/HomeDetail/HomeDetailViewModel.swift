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
}

class HomeDetailViewModel: HomeDetailViewModelProtocol {
    
    private(set) var model: HomeDetailModel
    weak var delegate: HomeDetailViewControllerProtocol?
    
    init(model: HomeDetailModel) {
        self.model = model
    }
    
    func getDetail() -> HomeDetailModel {
        return model
    }
}
