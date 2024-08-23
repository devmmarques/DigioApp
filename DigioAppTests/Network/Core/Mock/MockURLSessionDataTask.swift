//
//  MockURLSessionDataTask.swift
//  DigioAppTests
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation


class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
