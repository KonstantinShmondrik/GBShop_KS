//
//  AppBasket.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 07.08.2022.
//

import Foundation

class AppBasket {
    static let shared = AppBasket()
    init(){}
    
    var items: [AppBasketItem] = []
}

struct AppBasketItem {
    let productId: Int?
    let productName: String?
    let price: Int?
    let picUrl: String?
}
