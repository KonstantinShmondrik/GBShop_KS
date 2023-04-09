//
//  BasketRequestFactory.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 12.07.2022.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func getBusket(user: User, completionHandler: @escaping (AFDataResponse<BasketResult>) -> Void)
    func payBasket(user: User, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
    func addToBasket(basket: BasketRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
    func deleteFromBasket(basket: BasketRequest, completionHandler: @escaping (AFDataResponse<DefaultResult>) -> Void)
    
    }


