//
//  СhangeUserData.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 21.06.2022.
//

import Foundation
import Alamofire

class СhangeUserData: AbstractRequestFactory {
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

extension СhangeUserData: СhangeUserDataRequestFactory {
    
    
    
    func changeUserData(user: User, completionHandler: @escaping (AFDataResponse<СhangeUserDataResult>) -> Void) {
        let requestModel = UserData(baseURL: baseUrl, user: user)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension СhangeUserData {
    struct UserData: RequestRouter {
        let baseURL: URL
        let metod: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
        let user: User
        var parameters: Parameters? {
            return [
                "id_user": user.id,
                "username": user.login ,
                "password": user.password ?? "",
                "email": user.email ?? "",
                "gender": user.gender ?? "",
                "credit_card": user.creditCard ?? "",
                "bio": user.bio ?? ""
            ]
        }
    }
}


    
    
    

