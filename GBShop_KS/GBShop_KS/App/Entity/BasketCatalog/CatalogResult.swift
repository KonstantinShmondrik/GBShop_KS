//
//  Catalog.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 30.06.2022.
//

import Foundation

// MARK: - Catalog
struct CatalogResult: Codable {
    let pageNumber: Int
    let products: [ProductResult]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products
    }
}

// MARK: - Product
struct ProductResult: Codable {
    let idProduct: Int
    let productName: String
    let price: Int
    let shortDescription: String
    let picUrl: String
    
    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
        case shortDescription
        case picUrl
    }
}




