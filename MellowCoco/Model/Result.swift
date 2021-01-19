//
//  Result.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation

// JSON Result
struct Result<T: Codable> : Decodable {
    var code : Int
    var message: String
    var data : [T] // Todo 这里应该是[T?]
}

//struct Result : Decodable {
//    var code : Int
//    var message: String
//    var data : [Category]
//}
