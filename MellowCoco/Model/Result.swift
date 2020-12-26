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
