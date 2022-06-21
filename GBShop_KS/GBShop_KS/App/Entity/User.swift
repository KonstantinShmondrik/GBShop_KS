//
//  User.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 21.06.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String
    let password: String?
    let email: String?
    let gender: String?
    let creditCard: String?
    let bio: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
        case password
        case email
        case gender
        case creditCard = "credit_card"
        case bio
    }
}
