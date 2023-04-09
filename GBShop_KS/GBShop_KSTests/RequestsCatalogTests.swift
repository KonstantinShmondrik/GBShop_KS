//
//  RequestsCatalogTests.swift
//  GBShop_KSTests
//
//  Created by Константин Шмондрик on 07.07.2022.
//

import XCTest
import Alamofire
@testable import GBShop_KS

class RequestsCatalogTests: XCTestCase {
    var requestFactory: RequestFactory!
    
    let expectation = XCTestExpectation(description: "Perform request.")
    let timeoutValue = 10.0
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        
    }
    
    func testShouldPerformGetCatalogRequest() {
        let factory = requestFactory.makeGetCatalogRequestFactory()
        factory.getCatalog(pageNumber: 1, categoryId: 1) { [weak self] response in
            switch response.result {
            case .success: break
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformGetGoodByldRequest() {
        let factory = requestFactory.makeGetGoodByldRequestFactory()
        factory.getGoodByld(productId: 123) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
}



