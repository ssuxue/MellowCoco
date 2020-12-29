//
//  Result.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation

// JSON Result
struct Result : Decodable {
    var code : Int
    var message: String
    var data : [Category]
}

// TODO 后面用泛型优化这一堆 Result
struct ProductResult : Decodable {
    var code : Int
    var message: String
    var data : [Product]
}

struct UserResult : Decodable {
    var code : Int
    var message: String
    var data : [User]
}
