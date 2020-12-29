//
//  ContentView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/25.
//

import SwiftUI
import Moya

struct ContentView: View {
    var body: some View {
        BottomView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserViewModel())
    }
}


struct DashBoardView : View {
    @State var index = 0
    @State var categories: [Category] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("饮品")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            // Tab view
            HStack(spacing: 0) {
                Text("奶茶")
                    .foregroundColor(self.index == 0 ? .white : Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)).opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                
                Spacer(minLength: 0)
                
                Text("咖啡")
                    .foregroundColor(self.index == 1 ? .white : Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)).opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Text("甜点")
                    .foregroundColor(self.index == 2 ? .white : Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)).opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)).opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        
                        withAnimation(.default) {
                            self.index = 2
                        }
                    }
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            
            // loading progress if data is null
            if categories.isEmpty {
                Spacer()
                ProgressView()
            }
            else {
                // Tab view with swipe gesture
                TabView(selection: self.$index) {
                    
                    // loading progress if no data
                    GridView(categoryItems: categories)
                        .tag(0)
                    
                    GridView(categoryItems: categoryData)
                        .tag(1)
                    
                    VStack {
                        Text("dessert data")
                    }
                    .tag(2)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            Spacer(minLength: 0)
        }
        .padding(.top)
        .onAppear {
            // loading category data
            getCategory(url: "http://192.168.124.9:8080/getAllCategory") { (result) in
                if result.code == 200 {
                    self.categories = result.data
                }
                else {
                    self.categories = categoryData
                }

            }
            
            // moya 获取数据
            // TODO json转为对象
//            let provider = MoyaProvider<RequestAPI>()
//            provider.request(.getCategoty, completion: { result in
//                let message = "Couldn't access API"
//                switch result {
//                    case let .success(moyaResponse):
//                        let jsonString = try? moyaResponse.mapString()
//                        returnMessage = jsonString ?? message
//
//                        // do something in your app
//                    case let .failure(error):
//                        print(error)
//                        break;
//                    }
//            })
        }
    }
}

// DashBoard Grid
struct GridView: View {
    var categoryItems : [Category]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(categoryItems) { item in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(item.name)
                            .foregroundColor(.white)
                        
                        HStack {
                            Spacer(minLength: 0)
                            
                            Text("")
                        }
                    }
                    .padding()
                    .padding(.bottom, 25)
                    .background(Color(colors[item.id % 6]))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    Image(item.icon)
                        .renderingMode(.original)
                        .padding()
                        .background(Color.white.opacity(0.35))
                        .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 25)
    }
}

let colors = [
    #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),
    #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1),
    #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),
    #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
    #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),
    #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),
]
