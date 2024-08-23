//
//  NetworkConfiguration.swift
//  DigioApp
//
//  Created by Marco Marques on 19/08/24.
//

import Foundation

protocol RequestProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }

    func asURLRequest() -> URLRequest
}

extension RequestProtocol {
    func asURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
}
