//
//  HomeCoordinatorMock.swift
//  DigioAppTests
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation
@testable import DigioApp

class HomeCoordinatorMock: HomeCoordinatorProtocol {
    var showAlertCalled = false
    var openRechargeDetailCalled = false
    var openDetailViewCalled = false
    var closedViewCalled = false
    
    var alertConfig: AlertViewModel?
    var rechardDetail: RechargeDetailModel?
    var homeDetailModel: HomeDetailModel?

    func showAlert(alert: AlertViewModel) {
        showAlertCalled = true
        alertConfig = alert
    }

    func openRechargeDetail(model: RechargeDetailModel) {
        openRechargeDetailCalled = true
        rechardDetail = model
    }

    func openDetailView(model: HomeDetailModel) {
        openDetailViewCalled = true
        homeDetailModel = model
    }

    func closedView() {
        closedViewCalled = true
    }
}
