//
//  Review.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 07.07.2022.
//

import Foundation
import Alamofire

class Review: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    //    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    let baseUrl = URL(string: "https://stormy-reef-78957.herokuapp.com/")!
    
    init (
        errorParser: AbstractErrorParser,
        sessinManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessinManager
            self.queue = queue
        }
}

extension Review: ReviewRequestFactory {
    
    func getReviews(productId: Int, completionHandler: @escaping (AFDataResponse<[ReviewResult]>) -> Void) {
        let requestModel = GetReviews(baseURL: baseUrl, productId: productId)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func addReview(review: ReviewResult, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void) {
        let requestModel = AddReviews(baseURL: baseUrl, review: review)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func removeReview(review: ReviewResult, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void) {
        let requestModel = RemoveReviews(baseURL: baseUrl, review: review)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension Review {
    
    struct GetReviews: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "getReview.json"
        let productId: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}

extension Review {
    
    struct AddReviews: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "addReview.json"
        let review: ReviewResult
        
        
        var parameters: Parameters? {
            return [
                "id_user": review.userId ?? 0,
                "text": review.reviewText ?? ""
            ]
        }
    }
}

extension Review {
    
    struct RemoveReviews: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "removeReview.json"
        let review: ReviewResult
        
        
        var parameters: Parameters? {
            return [
                "id_user": review.userId ?? 0,
                "text": review.reviewText ?? ""
            ]
        }
    }
}




