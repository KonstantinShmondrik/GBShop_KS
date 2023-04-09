//
//  ResponseCodableTests.swift
//  GBShop_KSTests
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import XCTest
import Alamofire
@testable import GBShop_KS

class ResponseCodableTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    let timeoutValu = 10.0
    var errorParser: ErrorParserStub!
    
    struct PostStub: Codable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }
    
    enum ApiErrorStub: Error {
        case fatalError
    }
    
    struct ErrorParserStub: AbstractErrorParser {
        func parse(_ result: Error) -> Error {
            return ApiErrorStub.fatalError
        }
        
        func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
            return error
        }
    }
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        errorParser = ErrorParserStub()
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        errorParser = nil
    }
    
    func testShouldDownloadAndParse() {
        AF
            .request("https://jsonplaceholder.typicode.com/posts/1")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
                
                switch response.result {
                case .success(_):
                    break
                case .failure:
                    XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: timeoutValu)
    }
}

