//
//  Theme.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/29.
//

import SwiftUI

struct Theme: Identifiable, Decodable {
    var id: Int
    var name: String
    var colorName: String
    var hexadecimal: Int
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case colorName = "color_name"
        case hexadecimal
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }

    // let's suppose alpha is the first component (ARGB)
    convenience init(argb: Int) {
        self.init(
            red: (argb >> 16) & 0xFF,
            green: (argb >> 8) & 0xFF,
            blue: argb & 0xFF,
            a: (argb >> 24) & 0xFF
        )
    }
}
