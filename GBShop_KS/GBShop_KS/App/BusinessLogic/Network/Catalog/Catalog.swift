//
//  GetCatalog.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import Foundation
import Alamofire

class Catalog: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init (
        errorParser: AbstractErrorParser,
        sessinManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessinManager
            self.queue = queue
        }
}

extension Catalog: CatalogRequestFactory {
    
    
    func getCatalog(pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<[ProductResult]>) -> Void) {
        let requestModel = GetCatalog(baseURL: baseUrl, pageNumber: pageNumber, categoryId: categoryId)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension Catalog {
    struct GetCatalog: RequestRouter {
        var baseURL: URL
        var metod: HTTPMethod = .get
        var path: String = "catalogData.json"
        let pageNumber: Int
        let categoryId: Int
        
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}

