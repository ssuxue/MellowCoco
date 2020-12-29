//
//  ThemeView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/29.
//

import SwiftUI

struct ThemeView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.08)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                HStack {
                    Text("免费主题")
                        .font(.system(size: 13))
                        .foregroundColor(Color.black.opacity(0.6))
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                VStack {
                    VStack {
                        ForEach(themes) { item in
                            HStack(spacing: 16.0) {
                                VStack {
                                }
                                .frame(width: 20, height: 20)
                                .background(Color(UIColor(argb: item.hexadecimal)))
                                .cornerRadius(3.0)
                                .border(
                                    Color.gray,
                                    width: item.hexadecimal == 0xFFFFFFFF ? 0.8 : 0)
                                
                                Text(item.name)
                                Spacer()
                            }
                            
                            Divider()
                        }
                        .padding(.top)
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 3)
                }
                
                HStack(alignment: .center) {
                    Button(action: {}) {
                        Spacer()
                        Text("选购更多个性主题")
                            .foregroundColor(.pink)
                        Spacer()
                    }
                    .frame(height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 8, y: 8)
                    .shadow(color: Color.white.opacity(0.1), radius: 10, x: -8, y: -8)
                }
                .padding(.all)
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}

let themes = [
    Theme(id: 1, name: "简洁白", colorName: "white", hexadecimal: 0xFFFFFFFF),
    Theme(id: 2, name: "少女粉", colorName: "pink", hexadecimal: 0xFFFF6696),
    Theme(id: 3, name: "主题黑", colorName: "black", hexadecimal: 0xFF141414),
    Theme(id: 4, name: "高能红", colorName: "red", hexadecimal: 0xFFFF232E),
    Theme(id: 5, name: "咸蛋黄", colorName: "yellow", hexadecimal: 0xFFFFBB00),
    Theme(id: 6, name: "早苗绿", colorName: "green", hexadecimal: 0xFF74C441),
    Theme(id: 7, name: "宝石蓝", colorName: "blue", hexadecimal: 0xFF009AF3),
    Theme(id: 8, name: "紫罗兰", colorName: "purple", hexadecimal: 0xFFAC1CAF),
]
