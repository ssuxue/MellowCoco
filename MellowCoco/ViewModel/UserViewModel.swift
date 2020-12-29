//
//  UserViewModel.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/28.
//

import SwiftUI
import Combine
import Moya

class UserViewModel: ObservableObject {
    @Published var user = User(
        id: 0, username: "",
        password: "",
        nickname: "",
        phone: "",
        status: "",
        createTime: Date(),
        icon: "",
        gender: 0,
        birthday: Date(),
        credit: 0)
    @Published var isLogged = false
    
    func login(username: String, password: String) {
        let provider = MoyaProvider<RequestAPI>()
        
        provider.request(.login(username: username, password: password), completion: { result in
            switch result {
                case let .success(moyaResponse):
                    let jsonString = try? moyaResponse.mapString()
                    print(jsonString ?? "Couldn't access API")
                    self.isLogged = true

                case let .failure(error):
                    print(error)
                    self.isLogged = false
                    break;
                }
        })
    }
}
