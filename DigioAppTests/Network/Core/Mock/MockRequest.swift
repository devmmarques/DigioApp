//
//  MockRequest.swift
//  DigioAppTests
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation
@testable import DigioApp

class MockRequest: RequestProtocol {
    var baseURL: URL {
        return URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/")!
    }
    
    var path: String = ""
    
    var method: DigioApp.HTTPMethod {
        return .get
    }
    
    var headers: [String : String]?
    
    var body: Data?
    
    
}
