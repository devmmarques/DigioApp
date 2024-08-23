//
//  HomeViewModelTests.swift
//  DigioAppTests
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation
import XCTest
@testable import DigioApp

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockService: HomeServiceMock!
    var mockDelegate: HomeViewControllerMock!
    var mockCoordinator: HomeCoordinatorMock!

    override func setUp() {
        super.setUp()
        mockService = HomeServiceMock()
        mockDelegate = HomeViewControllerMock()
        mockCoordinator = HomeCoordinatorMock()
        viewModel = HomeViewModel(service: mockService, coordinator: mockCoordinator)
        viewModel.delegate = mockDelegate
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        mockDelegate = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testFetchHomeSuccess() {
        let homeMock = ModelMock.homeResponse
        mockService.fetchResult = .success(homeMock)
        
        viewModel.fetchHome()
        
        XCTAssertTrue(mockDelegate.updateCalled)
        
    }

    func testFetchHomeFailure() {
        
        let error = DigioNetworkBaseError.unknown
        mockService.fetchResult = .failure(error)
        
        viewModel.fetchHome()
        
        XCTAssertFalse(mockDelegate.updateCalled)
        XCTAssertTrue(mockCoordinator.showAlertCalled)
        XCTAssertEqual(mockCoordinator.alertConfig?.status, .error)
        XCTAssertEqual(mockCoordinator.alertConfig?.title, "Erro ao carregar")
        XCTAssertEqual(mockCoordinator.alertConfig?.description, "Não foi possível carregar os dados \n Deseja tentar novamente ?")
    }
    
    func testDidOpenProductDetail() {
        
        let product = ModelMock.products
        
        viewModel.didOpenProductDetail(model: product)
        
        XCTAssertTrue(mockCoordinator.openRechargeDetailCalled)
    }

    func testDidOpenRechargeDetail() {
        let spotlight = ModelMock.spotlight
        
        viewModel.didOpenRechargeDetail(model: spotlight)
        
        XCTAssertTrue(mockCoordinator.openRechargeDetailCalled)
    }
    
    func testDidOpenCashDetail() {
        
        let cash = ModelMock.cash
        viewModel.didOpenCashDetail(model: cash)
        
        
        XCTAssertTrue(mockCoordinator.openDetailViewCalled)
    }
}
