//
//  CocoNetwork.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import Foundation
import Moya

// 网络请求结构体 
struct CocoNetwork {

    // 请求成功的回调
    typealias successCallback = (_ result: Any) -> Void
    // 请求失败的回调
    typealias failureCallback = (_ error: MoyaError) -> Void

    // 单例
    static let provider = MoyaProvider<RequestAPI>()

    // 发送网络请求
    static func request(
        target: RequestAPI,
        success: @escaping successCallback,
        failure: @escaping failureCallback
        ) {

        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    try success(moyaResponse.mapJSON()) // 测试用JSON数据
                } catch {
                    failure(MoyaError.jsonMapping(moyaResponse))
                }
            case let .failure(error):
                failure(error)
            }
        }
    }
}
