//
//  OrderView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderView: View {
    
//    @State var showColor: Bool
    @State var cid: Int = 2
    @State var categories: [Category] = []
    @State private var showCard = false
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel()
    @ObservedObject var categoryVM: CategoryViewModel = CategoryViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    ScrollView {
                        ForEach(categoryVM.categories) { item in
                            VStack {
                                Image(item.icon)
                                Text(item.name)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.horizontal)
                            .background(
                                (self.cid == item.id) ? Color(#colorLiteral(red: 1, green: 0.7568627451, blue: 0.02745098039, alpha: 1)).opacity(0.5) : nil
                            )
                            .onTapGesture {
                                self.cid = item.id
                                
                                viewModel.fetchProducts(id: self.cid)
                            }
                        }
                    }
                    .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)).opacity(0.1))
                }
                .frame(width: screen.width * 0.25)
                
                VStack {
                    ScrollView {
                        ForEach(viewModel.products) { item in
                            HStack {
                                VStack(alignment: .center) {
                                    WebImage(url: URL(string: item.picture))
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: screen.width * 0.2)
                                }
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.system(size: 20, weight: .medium))
                                        .lineLimit(1)
                                    HStack {
                                        if (item.newStatus == 1) {
                                            self.item(tag: "新品", color: Color.green)
                                        }
                                        
                                        self.item(tag: "含乳及乳制品", color: Color.gray)
                                    }
                                    Text(item.description)
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                    HStack {
                                        Text("¥\(item.price)")
                                            .font(.title)
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            self.showCard.toggle()
                                        }, label: {
                                            Text("选规格")
                                                .font(.system(size: 16, weight: .medium))
                                                .padding(.vertical, 5)
                                                .padding(.horizontal, 14)
                                                .background(Color.orange)
                                                .foregroundColor(.white)
                                                .cornerRadius(15)
                                        })
                                    }
                                    .padding(.all, 5)
                                    .padding(.trailing, 15)
                                }
                            }
                        }
                    }
                }
                .frame(width: screen.width * 0.75)
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear {
                viewModel.fetchProducts(id: self.cid)
                
                categoryVM.fetchData()
                
            }
            if self.showCard {
                CustomActionSheet(showCard: self.$showCard)
            }
        }
    }
    
    public func item(tag: String, color: Color) -> some View {
        Text(tag)
            .padding(.all, 5)
            .font(.system(size: 15, weight: .regular))
            .background(color.opacity(0.3))
            .foregroundColor(color)
            .cornerRadius(5)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

let screen = UIScreen.main.bounds

let productList = [
    Product(
        id: 1,
        productCategoryId: 2,
        productAttributeIds: "1,2",
        name: "酒酿桂花冻",
        picture: "https://ww1.sinaimg.cn/bmiddle/882f5c5fly1gm1nzuey29j22c0340e82.jpg",
        newStatus: 1,
        recommendStatus: 1,
        verifyStatus: 1,
        sale: 1232,
        price: 26,
        description: "冷热皆宜 冷/热 500ml 定制红茶茗茶调和牛乳醇香，浓郁的气息充满了屋子。",
        albumPics: "https://ww1.sinaimg.cn/bmiddle/882f5c5fly1gm1nzuey29j22c0340e82.jpg,https://ww1.sinaimg.cn/bmiddle/882f5c5fly1gm1nqol91aj22ds1sckjm.jpg"),
    Product(
        id: 2,
        productCategoryId: 2,
        productAttributeIds: "1,2",
        name: "生打椰椰芒",
        picture: "https://wx4.sinaimg.cn/bmiddle/006lsU1Xly1gl9az260gmj30u014043z.jpg",
        newStatus: 1,
        recommendStatus: 1,
        verifyStatus: 1,
        sale: 1232,
        price: 25,
        description: "冷热皆宜 冷/热 500ml 定制红茶茗茶调和牛乳醇香，浓郁的气息充满了屋子。",
        albumPics: "https://wx4.sinaimg.cn/bmiddle/006lsU1Xly1gl9az260gmj30u014043z.jpg,https://ww1.sinaimg.cn/bmiddle/882f5c5fly1gm1nqol91aj22ds1sckjm.jpg"),
    Product(
        id: 3,
        productCategoryId: 2,
        productAttributeIds: "1,2",
        name: "冰博克厚牛乳波波",
        picture: "https://ww3.sinaimg.cn/bmiddle/006nsVfNgy1gl9c716eeuj325s2vpe82.jpg",
        newStatus: 1,
        recommendStatus: 1,
        verifyStatus: 1,
        sale: 1232,
        price: 21,
        description: "冷热皆宜 冷/热 500ml 定制红茶茗茶调和牛乳醇香，浓郁的气息充满了屋子。",
        albumPics: "https://ww3.sinaimg.cn/bmiddle/006nsVfNgy1gl9c716eeuj325s2vpe82.jpg,https://ww1.sinaimg.cn/bmiddle/882f5c5fly1gm1nqol91aj22ds1sckjm.jpg"),
]

struct CustomActionSheet: View {
    
    @Binding var showCard: Bool
    
    var body: some View {
        VStack(spacing: 10.0) {
            ZStack {
                WebImage(url: URL(string: "https://wx2.sinaimg.cn/mw690/a0bf4f85gy1gjsbogj0mdj23464t2u10.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screen.width * 0.25)
                
                HStack(spacing: 10.0) {
                    Spacer()
                    VStack {
                        Image(systemName: "arrowshape.turn.up.right")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }.padding(.all)
                    .frame(width: 32, height: 32)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                    .offset(y: -60)
                    
                    VStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                    }.padding(.all)
                    .frame(width: 32, height: 32)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                    .offset(y: -60)
                    .onTapGesture {
                        self.showCard.toggle()
                    }
                }
                .offset(y: 10)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("芝芝莓莓")
                        .font(.system(size: 20, weight: .medium))
                    Image(systemName: "leaf")
                        .foregroundColor(.green)
                    Image(systemName: "hare")
                        .foregroundColor(.pink)
                    Spacer()
                }
                
                HStack {
                    OrderView().item(tag: "新品", color: Color.green)
                    OrderView().item(tag: "含乳制品", color: Color.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 10.0) {
                IntroView(text: "产品描述")
                
                HStack {
                    IntroView(text: "冷热皆宜 冷/热 500ml 定制红茶茗茶调和牛乳醇香，浓郁的气息充满了屋子。")
                }
                .padding(.bottom, 20)
                
                IntroView(text: "原创0糖零卡糖")
                OrderView().item(tag: "原创0糖零卡糖", color: Color.black)
                    .opacity(0.5)
            }
            
            VStack {
                HStack {
                    Text("¥32")
                        .font(.title)
                        .foregroundColor(.orange)
                        .opacity(0.7)
                    
                    Spacer()
                }
                
                HStack {
                    Text("加入购物车")
                }
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: screen.width * 0.8,
                    height: .infinity
                )
                .padding(.vertical, 10)
                .background(Color.orange.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(5)
            }
        }
        .frame(
            width: screen.width * 0.8,
            alignment: .center
        )
        .padding(.horizontal, 20)
        .background(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 25)
        .shadow(color: Color.black.opacity(0.2), radius: 65, x: 0, y: -50)
        .shadow(color: Color.black.opacity(0.2), radius: 65, x: 0, y: 50)
    }
}

struct IntroView: View {
    @State var text: String = ""
    
    var body: some View {
        Text(text)
            .font(.system(size: 15))
            .foregroundColor(.gray)
    }
}
