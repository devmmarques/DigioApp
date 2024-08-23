//
//  RechargeDetailViewModel.swift
//  DigioApp
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation

protocol RechargeDetailViewModelProtocol: AnyObject {
    var delegate: RechargeDetailViewControllerProtocol? { get set }
    func getDetail() -> RechargeDetailModel
}

class RechargeDetailViewModel: RechargeDetailViewModelProtocol {
    
    private(set) var model: RechargeDetailModel
    weak var delegate: RechargeDetailViewControllerProtocol?
    
    init(model: RechargeDetailModel) {
        self.model = model
    }
    
    func getDetail() -> RechargeDetailModel {
        return model
    }
}
