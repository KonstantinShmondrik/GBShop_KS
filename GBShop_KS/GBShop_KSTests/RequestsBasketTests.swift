//
//  RequestsBasketTests.swift
//  GBShop_KSTests
//
//  Created by Константин Шмондрик on 12.07.2022.
//

import XCTest
import Alamofire
@testable import GBShop_KS

class RequestsBasketTests: XCTestCase {
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
    
    func testShouldPerformGetBasketRequest() {
        let factory = requestFactory.makeBasketRequestFactory()
        
        factory.getBusket(user: User(id: 123)) { response in
            switch response.result {
            case .success(let result): XCTAssertNotNil(result.countGoods)
                         case .failure: XCTFail()
                         }
                         self.expectation.fulfill()
                     }
                     wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformPayBasketRequest() {
        let factory = requestFactory.makeBasketRequestFactory()
        
        factory.payBasket(user: User(id: 123)) { [weak self] response in
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
    
    func testShouldPerformAddBasketRequest() {
        let factory = requestFactory.makeBasketRequestFactory()
        
        factory.addToBasket(basket: BasketRequest(idProduct: 666, quantity: 1)) { [weak self] response in
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
    
    func testShouldPerformDeleteBasketRequest() {
        let factory = requestFactory.makeBasketRequestFactory()
        
        factory.deleteFromBasket(basket: BasketRequest(idProduct: 666, quantity: 1)) { [weak self] response in
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


