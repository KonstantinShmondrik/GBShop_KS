//
//  ReviewResult.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 07.07.2022.
//

import Foundation

struct ReviewResult: Codable {
    let userId: Int?
    let reviewText: String?
    let productId: Int?
    
    enum CodingKeys: String, CodingKey {
        case reviewText = "text"
        case userId = "id_user"
        case productId = "id_product"
        
    }
}
