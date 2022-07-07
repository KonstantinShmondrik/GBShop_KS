//
//  ReviewRequestFactory.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 07.07.2022.
//

import Alamofire

protocol ReviewRequestFactory {
    func getReviews(productId: Int, completionHandler: @escaping (AFDataResponse<[ReviewResult]>) -> Void)
    
    func addReview(review: ReviewResult, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void)
    
    func removeReview(review: ReviewResult, completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void)
}
