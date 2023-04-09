//
//  GoodByldFactory.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import Foundation
import Alamofire

protocol GoodByldRequestFactory {
    func getGoodByld(productId: Int, completionHandler: @escaping (AFDataResponse<GoodByldResult>) -> Void)
}


