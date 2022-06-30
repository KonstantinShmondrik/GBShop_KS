//
//  AuthRequestFactory.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 21.06.2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    
    func login(userName: String,
               password: String,
               completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    
    func logout(userID: Int,
                completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
    
}

