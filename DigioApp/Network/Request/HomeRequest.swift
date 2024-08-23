//
//  HomeRequest.swift
//  DigioApp
//
//  Created by Marco Marques on 20/08/24.
//

import Foundation

struct HomeRequest: RequestProtocol {
    var baseURL: URL {
        URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/")!
    }
    
    var path: String {
        "products"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]?
    
    var body: Data?
    
    
}
