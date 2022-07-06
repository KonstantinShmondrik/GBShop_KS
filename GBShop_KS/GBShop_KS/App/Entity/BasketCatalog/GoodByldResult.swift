//
//  GoodByld.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import Foundation

// MARK: - GoodByld
struct GoodByldResult: Codable {
    let result: Int
    let productName: String
    let price: Int
    let description: String
    let productId: Int
    let picUrl: String

    enum CodingKeys: String, CodingKey {
        case result
        case productName = "product_name"
        case price
        case description
        case productId = "id_product"
        case picUrl
    }
}

