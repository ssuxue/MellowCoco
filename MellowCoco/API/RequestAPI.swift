//
//  SwiftUIView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation
import Moya

// moya请求地址枚举
public enum RequestAPI {
    case login(username: String, password: String)
    case getCategoty
    case getBubbleTeas(id: Int)
}

// ARK: - TargetType Protocol Implementation
extension RequestAPI: TargetType {
    public var baseURL: URL { return URL(string: "http://192.168.124.9:8080")! }
    public var path: String {
        switch self {
        case .login(_, _):
            return "/user/login"
        case .getCategoty:
            return "getAllCategory"
        case .getBubbleTeas(let id):
            return "/getMilkTea/\(id)"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .getCategoty, .getBubbleTeas:
            return .get
        case .login:
            return .post
        }
    }
    public var task: Task {
        switch self {
        case .getCategoty, .getBubbleTeas: // Send no parameters
            return .requestPlain
        case let .login(username, password):  // Always sends parameters in URL, regardless of which HTTP method is used
            return .requestParameters(parameters: ["username": username, "password": password], encoding: URLEncoding.queryString)
//        case let .createUser(firstName, lastName): // Always send parameters as JSON in request body
//            return .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
        }
    }
    public var sampleData: Data {
        switch self {
        case .getCategoty:
            return "{\"id\": 2, \"name\": \"夏季限定\", \"icon\": \"reason.png\"}".utf8Encoded
        case .getBubbleTeas(let id):
            return "{\"id\": \(id), \"first_name\": \"Harry\", \"last_name\": \"Potter\"}".utf8Encoded
        case .login(let username, let password):
            return "{\"usernae\": \"\(username)\", \"last_name\": \"\(password)\"}".utf8Encoded
        }
    }
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
