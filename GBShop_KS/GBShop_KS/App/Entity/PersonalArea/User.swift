//
//  User.swift
//  GBShop_KS
//
//  Created by Константин Шмондрик on 21.06.2022.
//

import Foundation

struct User: Codable {
    var id: Int?
    let login: String?
    let name: String?
    let lastname: String?
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
    
    init(id: Int? = nil,
         login: String? = nil,
         name: String? = nil,
         lastname: String? = nil,
         password: String? = nil,
         email: String? = nil,
         gender: String? = nil,
         creditCard: String? = nil,
         bio: String? = nil) {
        self.id = id
        self.login = login
        self.name = name
        self.lastname = lastname
        self.password = password
        self.email = email
        self.gender = gender
        self.creditCard = creditCard
        self.bio = bio
        
    }
}
