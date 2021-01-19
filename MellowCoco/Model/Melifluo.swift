//
//  Melifluo.swift
//  MellowCoco
//
//  Created by hhhhh on 2021/1/18.
//

import Foundation
import Moya

public protocol MelifluoMapper: Codable {
    mutating func didInit()
}

public class MelifluoModel {
    
    public static func model<T: MelifluoMapper>(_ data: Data?) -> T? {
        if let data = data {
            do {
                return try JSONDecoder.init().decode(T.self, from: data)
            }
            catch {
                debugPrint("key的类型不匹配" + error.localizedDescription)
                return nil
            }
        }
        else {
            debugPrint("MelifluoModel传入的data为nil")
            return nil
        }
    }
    
    public static func data<T: Encodable>(_ model: T?) -> Data? {
        if let model = model {
            do {
                return try JSONEncoder.init().encode(model)
            }
            catch {
                debugPrint("将\(model.self)转成JSON Data失败 \(error.localizedDescription)")
                return nil
            }
        }
        else {
            debugPrint("传入\(String(describing: model))为nil")
            return nil
        }
    }
}
