//
//  BasketRequest.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 12.07.2022.
//

import Foundation

struct BasketRequest: Codable {
    let idProduct: Int
    let quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case quantity
    }
}
