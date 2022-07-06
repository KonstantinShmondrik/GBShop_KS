//
//  Registration.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 21.06.2022.
//

import Foundation
import Alamofire

class Registration: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://stormy-reef-78957.herokuapp.com/")!
//    let baseUrl = URL(string: "https://stormy-reef-78957.herokuapp.com/")!
    init (
        errorParser: AbstractErrorParser,
        sessinManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessinManager
            self.queue = queue
        }
}

extension Registration: RegistrationRequestFactory {
    
    func register(user: User,
                  completionHandler: @escaping (AFDataResponse<DefaultResponse>) -> Void) {
        let requestModel = Register(baseURL: baseUrl, user: user)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
        
    }
    
}

extension Registration {
    struct Register: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .post
        let path: String = "registerUser.json"
        
        let user: User
        var parameters: Parameters? {
            return [
                "id_user": user.id ?? 0,
                "user_login": user.login ?? "",
                "password": user.password ?? "",
                "email": user.email ?? "",
                "gender": user.gender ?? "",
                "credit_card": user.creditCard ?? "",
                "bio": user.bio ?? "",
                "user_name": user.name ?? "",
                "user_lastname": user.lastname ?? ""
            ]
        }
    }
}


