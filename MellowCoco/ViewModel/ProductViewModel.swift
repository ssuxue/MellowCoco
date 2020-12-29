//
//  ProductViewModel.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    @Published var products = [Product]()
    
    func fetchProducts(id: Int) {
        getProducts(url: "http://192.168.124.9:8080/getBubbleTeaByCid/\(id)") { (result) in
            if result.code == 200 {
                self.products = result.data
            }
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
