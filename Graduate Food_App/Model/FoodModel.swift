//
//  FoodModel.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

struct FoodList: Codable {
    let foods: [Food]
}

// MARK: - Food
struct Food: Codable {
    let id: Int
    let name, image: String
    let price: Int
    let category: Category
}

enum Category: String, Codable {
    case desserts = "Desserts"
    case drinks = "Drinks"
    case meals = "Meals"
}
