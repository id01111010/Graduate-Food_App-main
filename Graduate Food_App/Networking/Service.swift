//
//  Service.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit

struct Constants {
    static let API_KEY = "http://kasimadalan.pe.hu/foods/"
    static let get_All_data = "\(API_KEY)getAllFoods.php"
    static let inserfood = "\(API_KEY)insertFood.php"
    static let getCartedFood = "http://kasimadalan.pe.hu/foods/getFoodsCart.php"
    static let getImages = "\(API_KEY)images/"
    static let deleteFood = "\(API_KEY)deleteFood.php"

}
enum ApiError: Error {
    case failedTogedData
}
class FoodService {
    static let shared = FoodService()
        //MARK: - getAllData(complition:@escaping(Result<[Food],ApiError>)
    
func getAllData(complition:@escaping(Result<[Food],ApiError>) ->Void ){
    guard let url = URL(string: "\(Constants.get_All_data)") else {return}
    URLSession.shared.dataTask(with: url) { (data,response,error) in
        DispatchQueue.main.async {
        if let error = error {
        print("Error",error)
        complition(.failure(ApiError.failedTogedData))
        return
        }
        guard let data = data else {return}
        do {
        let result = try JSONDecoder().decode(FoodList.self, from: data)
        complition(.success(result.foods))
        }catch  {
        complition(.failure(ApiError.failedTogedData))
        }
     }
    }.resume()
  }
    //MARK: - insertFood(cartId: Int, name: String, image: String)
    
    func insertFood(cartId: Int, name: String, image: String, price: Int,category: String, orderAmount: String, userName: String) {
        guard let url =  URL(string: Constants.inserfood)
        else {  return  }
        let postString = "cartId=\(cartId)&name=\(name)&image=\(image)&price=\(price)&category=\(category)&orderAmount=\(orderAmount)&userName=\(userName)"
        var request = URLRequest(url: url)
        request.httpBody = postString.data(using: .utf8)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request){
        (data , response, error)  in
        guard let data = data, error == nil else {
        print(error?.localizedDescription ?? "No data")
        return
        }
        guard let response = response else {return }
        print(response)
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [String: Any] {
            print(responseJSON)
        }
    }.resume()
    }
    //MARK: - getChartedFood(userName: String)
    
    func getChartedFood(userName: String, completion: @escaping(Result<[FoodsCart],ApiError>) ->Void){
        let url = URL(string: Constants.getCartedFood)
        guard let url = url else {return}
        var request = URLRequest(url: url)
        let postString = "userName=\(userName)"
        request.httpBody = postString.data(using: .utf8)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
        print("Error took place \(error)")
        completion(.failure(ApiError.failedTogedData))
        return
        }
        guard let data = data else {return}
        do{
        let json = try JSONDecoder().decode(GetFood.self, from: data)
        completion(.success(json.foodsCart))
        print(json.foodsCart)
            
        }catch let jsonErr{
        print(jsonErr.localizedDescription)
        completion(.failure(.failedTogedData))
       }
    }
    task.resume()
    }
    //MARK: - deleteFood(cartId: Int, userName: String)
    
    func deleteFood(cartId: Int, userName: String) {
        guard let url =  URL(string: Constants.deleteFood)
        else { return  }
        let postString = "cartId=\(cartId)&userName=\(userName)"
        var request = URLRequest(url: url)
        request.httpBody = postString.data(using: .utf8)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request){
        (data , response, error)  in
        guard let data = data, error == nil else {
        print(error?.localizedDescription ?? "No data")
        return
        }
        guard let response = response else { return }
        print(response)
        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
        if let responseJSON = responseJSON as? [String: Any] {
        print(responseJSON)
        }
    }.resume()
 }
}
    

