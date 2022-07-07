//
//  RequestFactory.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 21.06.2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    // MARK: - Auth
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser,
                    sessinManager: commonSession,
                    queue: sessionQueue)
    }
    
    // MARK: - Regist
    func makeRegistRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser,
                            sessinManager: commonSession,
                            queue: sessionQueue)
    }
    
    // MARK: - СhangeUserData
    func makeСhangeUserDataFactory() -> СhangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return СhangeUserData(errorParser: errorParser,
                              sessinManager: commonSession,
                              queue: sessionQueue)
    }
    
    // MARK: - GetCatalog
    func makeGetCatalogRequestFactory() -> CatalogRequestFactory {
        let errorParser = makeErrorParser()
        return Catalog(errorParser: errorParser,
                       sessinManager: commonSession,
                       queue: sessionQueue)
    }
    
    // MARK: - GetGoodByldFactory
    func makeGetGoodByldRequestFactory() -> GoodByldRequestFactory {
        let errorParser = makeErrorParser()
        return GoodByld(errorParser: errorParser,
                        sessinManager: commonSession,
                        queue: sessionQueue)
    }
    
    // MARK: - GetRewiewRequestFactory
    func makeGetRewiewRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessinManager: commonSession,
                      queue: sessionQueue)
    }
    
    // MARK: - AddRewiewRequestFactory
    func makeAddRewiewRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessinManager: commonSession,
                      queue: sessionQueue)
    }
    
    // MARK: - RemoveRewiewRequestFactory
    func makeRemoveRewiewRequestFactory() -> ReviewRequestFactory {
        let errorParser = makeErrorParser()
        return Review(errorParser: errorParser,
                      sessinManager: commonSession,
                      queue: sessionQueue)
    }
    
}
