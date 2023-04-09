//
//  BasketResult.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 12.07.2022.
//

import Foundation





struct BasketResult: Codable {
    let amount: Int
    let contents: [BasketContent]
    let countGoods: Int
}

// MARK: - Content
struct BasketContent: Codable {
    let productName: String
    let quantity, price, idProduct: Int

    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case quantity, price
        case idProduct = "id_product"
    }
}
