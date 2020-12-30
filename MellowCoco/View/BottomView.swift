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

// loading animation
struct Loader: View {
    @State var animate = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(
                    AngularGradient(
                        gradient: .init(colors: [.pink, .purple]),
                        center: .center),
                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                )
                .frame(width: 35, height: 35)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
        }
        .padding(15)
        .background(Color.white)
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.2), radius: 5)
        .onAppear {
            self.animate.toggle()
        }
    }
}
