//
//  GetFood.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import Foundation
struct GetFood: Codable {
    let foodsCart: [FoodsCart]
    
    enum CodingKeys: String, CodingKey {
        case foodsCart = "foods_cart"
    }
}

// MARK: - FoodsCart
struct FoodsCart: Codable {
    let cartID: Int
    let name, image: String
    let price: Int
    let category: String
    let orderAmount: Int
    let userName: String

    enum CodingKeys: String, CodingKey {
        case cartID = "cartId"
        case name, image, price, category, orderAmount, userName
    }
}
