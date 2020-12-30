//
//  BottomView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import SwiftUI

struct BottomView: View {
    
    @Binding var currentIndex: Int
    
    var body: some View {
        TabView(selection: $currentIndex) {
            DashBoardView(currentIndex: $currentIndex).tabItem {
                Image("home")
                Text("首页")
            }.tag(0)
            
            OrderView().tabItem {
                Image("order")
                Text("点单")
            }.tag(1)
            
            ShopView().tabItem {
                Image("shop")
                Text("百货")
            }.tag(2)
            
            IndentView().tabItem {
                Image("bill")
                Text("订单")
            }.tag(3)
            
            MyInfoView().tabItem {
                Image("user")
                Text("我的")
            }.tag(4)
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView(currentIndex: .constant(0))
            .environmentObject(UserViewModel())
    }
}
