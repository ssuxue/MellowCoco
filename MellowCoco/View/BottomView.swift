//
//  BottomView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import SwiftUI

struct BottomView: View {
    var body: some View {
        TabView {
            DashBoardView().tabItem {
                Image("home")
                Text("首页")
            }
            
            OrderView().tabItem {
                Image("order")
                Text("点单")
            }
            
            ShopView().tabItem {
                Image("shop")
                Text("百货")
            }
            
            IndentView().tabItem {
                Image("bill")
                Text("订单")
            }
            
            MyInfoView().tabItem {
                Image("user")
                Text("我的")
            }
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
            .environmentObject(UserViewModel())
    }
}
