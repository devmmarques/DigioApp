//
//  HomeViewControllerMock.swift
//  DigioAppTests
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation
@testable import DigioApp

class HomeViewControllerMock: HomeViewControllerProtocol {
    var updateCalled = false
    var updatedModel: ListHomeModel?

    func update(model: ListHomeModel) {
        updateCalled = true
        updatedModel = model
    }
}
