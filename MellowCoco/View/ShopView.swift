//
//  ShopView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShopView: View {
    private var numberOfImages = 4;
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("奈雪百货")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            HStack {
                VStack {
                    // auto slide show image
                    GeometryReader { proxy in
                        TabView(selection: $currentIndex) {
                            ForEach(0..<swipeImages.count, id: \.self) { index in
                                WebImage(url: swipeImages[index])
                                    .resizable()
                                    .scaledToFit()
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .padding()
                        .frame(width: proxy.size.width)
                        .onReceive(timer, perform: { _ in
                            withAnimation {
                                // set the page to be next image
                                currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
                            }
                        })
                    }
                    .frame(maxHeight: 200)
                    
                    ShopCard()
                    
                    VStack {
                        HStack {
                            Text("灵感周边")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ForEach(peripheryImages) { item in
                            VStack(spacing: 16.0) {
                                HStack {
                                    WebImage(url: URL(string: item.image))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: screen.width / 3)
                                    
                                    Spacer(minLength: 0)
                                    
                                    VStack(spacing: 8.0) {
                                        Text(item.name)
                                        Text("¥ \(item.price)")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        HStack {
                                            Text("立即购买")
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical, 5)
                                        .foregroundColor(.white)
                                        .background(Color.orange)
                                        .cornerRadius(15)
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .frame(width: screen.width - 60)
                                .background(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)))
                                .cornerRadius(15)
                                .shadow(color: Color.black
                                            .opacity(0.2), radius: 5, x: 8, y: 8)
                                .shadow(color: Color.black
                                        .opacity(0.05), radius: 5, x: -8, y: -8)
                            }
                        }
                    }
                    
                    Spacer(minLength: 0)
                }
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}

private let swipeImages = [
    URL(string: "https://wx2.sinaimg.cn/large/" +
            "006qfuDrgy1gl9t5wwcmgj30fk078gr8.jpg"),
    URL(string: "https://wx4.sinaimg.cn/large/" +
            "a727902fgy1gm4w7euiz4j20fk078dj4.jpg"),
    URL(string: "https://wx4.sinaimg.cn/large/" +
            "a727902fgy1glod2cdve4j20fk078n3c.jpg"),
    URL(string: "https://wx3.sinaimg.cn/large/" +
            "a727902fgy1gl71luds7wj20fk0780vw.jpg")
]

private let peripheryImages = [
    Periphery(
        id: 1,
        image: "https://wx4.sinaimg.cn/mw690/" +
            "006qfuDrgy1gkqxbny0xfj33342bce82.jpg",
        name: "霸气橙子",
        price: 25),
    Periphery(
        id: 2,
        image: "https://wx2.sinaimg.cn/mw690/" +
            "006qfuDrgy1glorol3z2aj32dc35s7wi.jpg",
        name: "霸气生日草莓",
        price: 36),
    Periphery(
        id: 3,
        image: "https://wx4.sinaimg.cn/mw690/" +
            "006qfuDrgy1gkl988z8inj30p011he81.jpg",
        name: "奈雪软欧包",
        price: 28),
    Periphery(
        id: 4,
        image: "https://wx4.sinaimg.cn/mw690/" +
            "006qfuDrgy1gloroo9siej32bc3347wi.jpg",
        name: "北海道云朵吐司",
        price: 36),
    Periphery(
        id: 5,
        image: "https://wx3.sinaimg.cn/mw690/" +
            "006qfuDrgy1glopaeukqjj32bc334b2a.jpg",
        name: "脆弱蛋挞",
        price: 5),
    Periphery(
        id: 6,
        image: "https://wx2.sinaimg.cn/mw690/" +
            "006qfuDrgy1gkz2ykaxw9j30iz0shadk.jpg",
        name: "蜜桃撞撞宝藏茶",
        price: 36),
]

struct ShopCard: View {
    var body: some View {
        HStack(spacing: 16) {
            VStack {
                Text("草莓云朵果酱")
                    .fontWeight(.bold)
                HStack {
                    Text("大瓶更尽兴")
                        .font(.callout)
                    
                    Image(systemName: "chevron.right")
                }
                .padding(.all, 3)
                .foregroundColor(.black)
                .overlay(Color.pink.opacity(0.3))
                
                Image("jam-jar-berries-512")
                    .resizable()
                    .scaledToFit()
                    .frame(width: (screen.width / 4))
            }
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(5)
            
            VStack {
                HStack {
                    VStack(spacing: 8.0) {
                        Text("当季果汁")
                            .fontWeight(.bold)
                        Text("天气凉喝热饮")
                            .font(.callout)
                    }
                    
                    Image("juice-glass-drink-fruit-512")
                        .resizable()
                        .scaledToFit()
                        .frame(width: (screen.width / 5))
                }
                .padding(.horizontal)
                .padding(.vertical, 7)
                .background(Color.black.opacity(0.1))
                .cornerRadius(5)
                
                HStack {
                    VStack(spacing: 8.0) {
                        Text("寒冬热饮")
                            .fontWeight(.bold)
                        Text("暖心又暖胃")
                            .font(.callout)
                    }
                    
                    Image("juice-jug-cup-glass-512")
                        .resizable()
                        .scaledToFit()
                        .frame(width: (screen.width / 5))
                }
                .padding(.horizontal)
                .padding(.vertical, 7)
                .background(Color.black.opacity(0.1))
                .cornerRadius(5)
            }
        }
        .padding(.horizontal)
    }
}
