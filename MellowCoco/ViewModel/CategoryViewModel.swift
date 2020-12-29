//
//  CategoryViewModel.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/28.
//

import SwiftUI
import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories = [Category]()
    
    func fetchData() {
        getCategory(url: "http://192.168.124.9:8080/getAllCategory") { (result) in
            if result.code == 200 {
                self.categories = result.data
            }
            else {
                self.categories = categoryData
            }
        }
    }
}
