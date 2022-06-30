//
//  RequestsTests.swift
//  GBShop_KSTests
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import XCTest
import Alamofire
@testable import GBShop_KS

class RequestsTests: XCTestCase {
    var requestFactory: RequestFactory!
    var  user: User!
    
    let expectation = XCTestExpectation(description: "Perform request.")
    let timeoutValu = 10.0
    
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        user = User(id: 123,
                    login: "Somebody",
                    name: "John",
                    lastname: "Doe",
                    password: "mypassword",
                    email: "some@some.ru",
                    gender: "m",
                    creditCard: "9872389-2424-234224-234",
                    bio: "This is good! I think I will switch to another language")
        
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        user = nil
    }
    
    func testShouldPerformRegistRequest() {
        let factory = requestFactory.makeRegistRequestFactory()
        factory.register(user: user) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }
    
    func testShouldPerformAuthRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        factory.logout(userID: user.id ?? 0) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }
    
    func testShouldPerformChangeUserDataRequest() {
        let factory = requestFactory.makeСhangeUserDataFactory()
        factory.changeUserData(user: user) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }
    func testShouldPerformLogoutRequest() {
        let factory = requestFactory.makeAuthRequestFactory()
        factory.logout(userID: user.id ?? 0) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValu)
    }
}


