//
//  User.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/28.
//

import SwiftUI

struct User: Identifiable, Codable {
    var id: Int
    var username: String
    var password: String
    var nickname: String
    var phone: String
    var status: String
    var createTime: Date
    var icon: String
    var gender: Int
    var birthday: Date
    var credit: Int
    
    enum CodingKeys : String, CodingKey {
        case id
        case username
        case password
        case nickname
        case phone
        case status
        case createTime = "create_time"
        case icon
        case gender
        case birthday
        case credit
    }
}
