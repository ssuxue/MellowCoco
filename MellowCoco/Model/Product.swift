//
//  BubbleTea.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation

struct Product : Identifiable, Decodable {
    var id: Int
    var product_category_id: Int
    var product_attribute_ids: String
    var name: String
    var picture: String
    var new_status: Int8
    var recommend_status: Int8
    var verify_status: Int8
    var sale: Int
    var price: Int
    var description: String
    var album_pics: String
}

func getProducts(url: String, completion : @escaping (ProductResult)->()) {
    let session = URLSession.shared
    
    session.dataTask(with: URL(string: url)!) { (data, _, err) in
        if err != nil {
            print(err!.localizedDescription)
            return
        }
        
        // decoding JSON
        do {
            let products = try JSONDecoder().decode(ProductResult.self, from: data!)
            
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
