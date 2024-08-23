//
//  HomeViewControllerSnapshotTests.swift
//  DigioAppUITests
//
//  Created by Marco Marques on 23/08/24.
//

@testable import DigioApp
import XCTest
import FBSnapshotTestCase

class HomeViewControllerSnapshotTests: SnapshotTestCase {
    
    var viewModel: HomeViewModelMock!
    var mockService: HomeServiceMock!
    var viewController: HomeViewController!
    var mockCoordinator: HomeCoordinatorMock!
    
    override func setUp() {
        super.setUp()
        
        mockService = HomeServiceMock()
        
        mockCoordinator = HomeCoordinatorMock()
        viewModel = HomeViewModelMock()
        viewController = HomeViewController(viewModel: viewModel, homeView: HomeView())
        viewModel.delegate = viewController
        // Ative para gravar a imagem de referência na primeira vez.
        self.recordMode = false
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        viewController = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testMyViewController() {
        mockService.fetchResult = .success(ModelMockScreenshoot.homeResponse)
        viewModel.mockHomeResponse = ModelMockScreenshoot.homeResponse
        viewController.viewDidLoad()
        
        verifyViewController(viewController)
    }
}
