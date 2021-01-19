//
//  BubbleTea.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation

struct Product : Identifiable, Codable {
    var id: Int
    var productCategoryId: Int
    var productAttributeIds: String
    var name: String
    var picture: String
    var newStatus: Int8
    var recommendStatus: Int8
    var verifyStatus: Int8
    var sale: Int
    var price: Int
    var description: String
    var albumPics: String
    
    enum CodingKeys : String, CodingKey {
        case id
        case productCategoryId = "product_category_id"
        case productAttributeIds = "product_attribute_ids"
        case name
        case picture
        case newStatus = "new_status"
        case recommendStatus = "recommend_status"
        case verifyStatus = "verify_status"
        case sale
        case price
        case description
        case albumPics = "album_pics"
    }
}

func getProducts(url: String, completion : @escaping (Result<Product>)->()) {
    let session = URLSession.shared
    
    session.dataTask(with: URL(string: url)!) { (data, _, err) in
        if err != nil {
            print(err!.localizedDescription)
            return
        }
        
        // decoding JSON
        do {
            let products = try JSONDecoder().decode(Result<Product>.self, from: data!)
            
            completion(products)
        }
        catch {
            print(error)
        }
    }
    .resume()
}

func changeProducts(url: String) -> [Product] {
    
    var list: [Product] = []
    
    getProducts(url: url) { (result) in
        if result.code == 200 {
            list = result.data
        }
    }
    
    return list
}
