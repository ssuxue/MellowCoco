//
//  Category.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation

struct Category : Identifiable, Codable {
    var id : Int
    var name : String
    var icon : String
}

func getCategory(url: String, completion : @escaping (Result<Category>)->()) {
//    let session = URLSession(configuration: .default)
    let session = URLSession.shared
    
    session.dataTask(with: URL(string: url)!) { (data, _, err) in
        if err != nil {
            print(err!.localizedDescription)
            return
        }
        
        // decoding JSON
        do {
            let categories = try JSONDecoder().decode(Result<Category>.self, from: data!)
            
            completion(categories)
        }
        catch {
            print(error)
        }
    }
    .resume()
}

var categoryData = [
    Category(id: 0, name: "夏日清爽", icon: "reason"),
    Category(id: 1, name: "夏日清爽", icon: "energy"),
    Category(id: 2, name: "夏日清爽", icon: "cherry"),
    Category(id: 3, name: "夏日清爽", icon: "reason"),
    Category(id: 4, name: "夏日清爽", icon: "reason"),
    Category(id: 5, name: "夏日清爽", icon: "energy"),
]
