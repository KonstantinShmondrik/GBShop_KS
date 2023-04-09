//
//  GoodByld.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import Foundation
import Alamofire

class GoodByld: AbstractRequestFactory {
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

extension GoodByld: GoodByldRequestFactory {
    
    func getGoodByld(productId: Int, completionHandler: @escaping (AFDataResponse<GoodByldResult>) -> Void) {
        let requestModel = GoodByld(baseURL: baseUrl, productId: productId )
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension GoodByld {
    struct GoodByld: RequestRouter {
        var baseURL: URL
        var metod: HTTPMethod = .post
        var path: String = "getGoodById.json"
        let productId: Int
        
        var parameters: Parameters? {
            return [
                "id_product": productId
            ]
        }
    }
}




