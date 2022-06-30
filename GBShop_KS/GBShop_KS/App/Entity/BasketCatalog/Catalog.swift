//
//  Catalog.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import Foundation

// MARK: - Catalog
struct Catalog: Codable {
    let pageNumber: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products
    }
}

// MARK: - Product
struct Product: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
    }
}
