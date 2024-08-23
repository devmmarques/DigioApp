//
//  MockDigioBaseService.swift
//  DigioAppTests
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

@testable import DigioApp

class MockURLSession: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: DigioNetworkBaseError?
        
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.data, self.response, self.error)
        }
    }
    
}
