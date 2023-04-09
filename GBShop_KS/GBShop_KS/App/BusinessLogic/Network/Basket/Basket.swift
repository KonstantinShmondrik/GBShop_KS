//
//  Basket.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 12.07.2022.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
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

extension Basket: BasketRequestFactory {
    func getBusket(user: User, completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void) {
        let requestModel = GetBasket(baseURL: baseUrl, userId: user.id ?? 0)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func payBasket(user: User, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = PayBasket(baseURL: baseUrl, userId: user.id ?? 0)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func addToBasket(basket: BasketRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = AddBasket(baseURL: baseUrl, basket: basket)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    func deleteFromBasket(basket: BasketRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void) {
        let requestModel = DeleteBasket(baseURL: baseUrl, basket: basket)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
    
    
}

extension Basket {
    struct GetBasket: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "getBasket.json"
        let userId: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
}

extension Basket {
    struct PayBasket: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "payBasket.json"
        let userId: Int
        
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
}

extension Basket {
    struct AddBasket: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "addToBasket.json"
        let basket: BasketRequest
        
        var parameters: Parameters? {
            return [
                "id_product" : basket.idProduct,
                "quantity" : basket.quantity
            ]
        }
    }
}

extension Basket {
    struct DeleteBasket: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "deleteFromBasket.json"
        let basket: BasketRequest
        
        var parameters: Parameters? {
            return [
                "id_product" : basket.idProduct
            ]
        }
    }
}
