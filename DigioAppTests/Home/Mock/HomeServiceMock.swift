//
//  HomeServiceMock.swift
//  DigioAppTests
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation
@testable import DigioApp

class HomeServiceMock: HomeServiceProtocol {
    var fetchResult: Result<HomeResponse, DigioNetworkBaseError>?

    func fetch(completion: @escaping (Result<HomeResponse, DigioNetworkBaseError>) -> Void) {
        if let result = fetchResult {
            completion(result)
        }
    }
}
