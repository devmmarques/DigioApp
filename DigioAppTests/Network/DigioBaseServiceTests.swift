//
//  DigioBaseServiceTests.swift
//  DigioAppTests
//
//  Created by Marco Marques on 20/08/24.
//

import XCTest
@testable import DigioApp

class DigioBaseServiceTests: XCTestCase {
    
    var mockSession: MockURLSession!
    var digioBaseService: DigioBaseService!
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        digioBaseService = DigioBaseService(session: mockSession)
    }
    
    override func tearDown() {
        mockSession = nil
        digioBaseService = nil
        super.tearDown()
    }
    
    func testFetchNetworkSuccess() {
        let jsonData = """
        {
            "id": 1,
            "name": "Marco Marques"
        }
        """.data(using: .utf8)
        
        mockSession.data = jsonData
        mockSession.response = HTTPURLResponse(url: URL(string: "https://api.example.com")!,
                                               statusCode: 200, httpVersion: nil, headerFields: nil)
        mockSession.error = nil
        
        let request = MockRequest()
        let expectation = self.expectation(description: "Fetch network success result data")
        
        digioBaseService.fetch(request: request, model: ModelMockCodable.self) { [weak self] (result: Result<ModelMockCodable, DigioNetworkBaseError>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let model):
                XCTAssertEqual(model.name, "Marco Marques")
                expectation.fulfill()
            case .failure:
                XCTFail("O teste deveria ter sido com sucesso.")
            }
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    // Teste para quando o serviço retornar qualquer error.
    func testFetchNetworkErro() {
       
    }
    
    // Teste de resposta vazia quando não vem nenhum dado.
    func testFetchNoDataError() {
       
    }
}
