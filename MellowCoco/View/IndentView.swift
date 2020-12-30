//
//  IndentView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import SwiftUI

struct IndentView: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 0) {
                    Text("当前订单")
                        .foregroundColor(self.index == 0 ? .white : Color(#colorLiteral(red: 1, green: 0.2745098039, blue: 0.2745098039, alpha: 1)).opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(Color(#colorLiteral(red: 1, green: 0.5215686275, blue: 0.5215686275, alpha: 1)).opacity(self.index == 0 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            withAnimation(.default) {
                                self.index = 0
                            }
                        }
                    
                    Text("历史订单")
                        .foregroundColor(self.index == 1 ? .white : Color(#colorLiteral(red: 1, green: 0.2745098039, blue: 0.2745098039, alpha: 1)).opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 35)
                        .background(Color(#colorLiteral(red: 1, green: 0.5215686275, blue: 0.5215686275, alpha: 1)).opacity(self.index == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            withAnimation(.default) {
                                self.index = 1
                            }
                        }
                }
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                
            }
            .padding(.vertical)
            .padding(.horizontal)
            .background(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)))
            .cornerRadius(15)
            .shadow(color: Color.green.opacity(0.2), radius: 5)
            
            // 这层条件中再进行判断有没有订单变更视图
            // 这次项目就不写这个了
            if (self.index == 0) {
                VStack(alignment: .center, spacing: 10.0) {
                    Image("BalloonLost-big")
                        .resizable()
                        .scaledToFit()
                    
                    Text("您今天还没有下单")
                        .foregroundColor(.gray)
                    Text("快去选择一杯喜欢的茶吧")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
            else {
                VStack(alignment: .center, spacing: 10.0) {
                    Image("IceCreamSpill-big")
                        .resizable()
                        .scaledToFit()
                    
                    Text("您还没有下单")
                        .foregroundColor(.gray)
                    Text("快去选择一杯喜欢的茶吧")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct IndentView_Previews: PreviewProvider {
    static var previews: some View {
        IndentView()
    }
}
