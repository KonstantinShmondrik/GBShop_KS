//
//  СhangeUserDataFactory.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 21.06.2022.
//

import Foundation
import Alamofire

protocol СhangeUserDataRequestFactory {
    func changeUserData(user: User,
                  completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
}
