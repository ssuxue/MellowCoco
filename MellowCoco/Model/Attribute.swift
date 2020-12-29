//
//  Attribute.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation

struct Attribute : Identifiable, Decodable {
    var id: Int
    var name: String
    var inputList: String
    var type: Int8
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case inputList = "input_list"
        case type
    }
}
