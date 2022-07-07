//
//  RequestsReviewTests.swift
//  GBShop_KSTests
//
//  Created by Константин Шмондрик on 07.07.2022.
//

import XCTest
import Alamofire
@testable import GBShop_KS

class RequestsReviewTests: XCTestCase {
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
    
    func testShouldPerformGetReviewsRequest() {
        let factory = requestFactory.makeGetRewiewRequestFactory()
        
        factory.getReviews(productId: 123) { response in
            switch response.result {
            case .success(let result): XCTAssertGreaterThan(result.count, 0)
            case .failure: XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testShouldPerformAddReviewsRequest() {
        let factory = requestFactory.makeAddRewiewRequestFactory()
        
        factory.addReview(review: ReviewResult(userId: 123, reviewText: "Хороший товар - надо брать!", productId: 123)) { [weak self] response in
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
    
    func testShouldPerformRemoveReviewsRequest() {
        let factory = requestFactory.makeAddRewiewRequestFactory()
        
        factory.removeReview(review: ReviewResult(userId: 123, reviewText: "Хороший товар - надо брать!", productId: 123)) { [weak self] response in
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

