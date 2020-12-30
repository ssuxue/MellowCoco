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
        VStack {
            HStack {
                Text("奈雪百货")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
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
                .frame(width: proxy.size.width, height: proxy.size.height / 3)
                .onReceive(timer, perform: { _ in
                    withAnimation {
                        // set the page to be next image
                        currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
                    }
                })
            }
            
            HStack {
                
            }
            
            Spacer(minLength: 0)
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
