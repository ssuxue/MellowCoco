//
//  MyInfoView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/26.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyInfoView: View {
    
    @State private var fullScreen = true
    @EnvironmentObject var user: UserViewModel
    
    var avatar = "https://pic4.zhimg.com/80/v2-608a0a03b6693ca2f2b46c35c9f13cee.jpg?source=1940ef5c"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10.0) {
                    HStack {
                        Image("illustration")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
//                    if user.isLogged {
                    if true {
                        HasLoginView(avatar: self.avatar)
                    }
                    else {
                        VStack {
                            Button(action: {
                                self.fullScreen.toggle()
                            }, label: {
                                NavigationLink(destination: WelcomeView()) {
                                    HStack {
                                        Text("登录 / 注册")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(.blue)
                                    }
                                    .padding(.vertical, 10)
                                }
                            })
                            
                            NoLoginView()
                        }
                    }
                }
                .padding(.vertical, 25)
                .edgesIgnoringSafeArea(.top)
                .navigationBarTitle("返回")
                .navigationBarHidden(fullScreen)
            }
        }
        .statusBar(hidden: fullScreen)
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
            .environmentObject(UserViewModel())
    }
}

struct HasLoginView: View {
    @State var avatar: String = ""
    @EnvironmentObject var user: UserViewModel
    
    var body: some View {
        VStack {
            // avatar 头像
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    WebImage(url: URL(string: self.avatar))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                        .shadow(color: Color.white.opacity(0.5), radius: 5, x: -8, y: -8)
                })
            }
            
            HStack {
                Text("你头发乱了喔")
                    .foregroundColor(Color.black.opacity(0.8))
            }
            .padding(.top, 5)
            .padding(.bottom, 10)
            
            // card
            HStack(spacing: 30.0) {
                VStack(spacing: 8) {
                    Image("credit")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("0")
                        .font(.title)
                    
                    Text("积分商城")
                }
                
                VStack(spacing: 8) {
                    Image("coupons")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("0")
                        .font(.title)
                    
                    Text("悦茶券")
                }
                
                VStack(spacing: 8) {
                    Image("gift")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("0")
                        .font(.title)
                    
                    Text("活动礼包")
                }
            }
            .padding(.vertical)
            .frame(width: screen.width * 0.87, height: 120)
            .background(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -8, y: 0)
            
            HStack {
                VStack {
                    Text("任务中心")
                        .font(.headline)
                    Text("MISSION CENTER")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Image("sweet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.all)
            .padding(.horizontal)
            .frame(width: screen.width * 0.87, height: 120)
            .background(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)))
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 12)
            .shadow(color: Color.white.opacity(0.1), radius: 5, x: -8, y: 0)
            
            VStack(spacing: 20) {
                HStack {
                    Text("会员码")
                    Spacer()
                    Text("门店扫码积分和茶悦券支付")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                Divider()
                
                HStack {
                    Text("兑换中心")
                    Spacer()
                    Text("兑换会员、茶悦券和礼包等")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                Divider()
                
                NavigationLink(
                    destination: ThemeView()) {
                    HStack {
                        Text("主题")
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                
                Divider()
                
                HStack {
                    Text("消息中心")
                    Spacer()
                }
                Divider()
                
                HStack(alignment: .center) {
                    Button(action: {
                        self.user.isLogged = false
                    }, label: {
                        Text("退出当前帐号")
                            .foregroundColor(.white)
                    })
                }
                .padding(.horizontal, 10)
                .frame(width: screen.width * 0.7, height: 40)
                .background(Color.black.opacity(0.8))
            }
            .padding(.all)
            .padding(.horizontal)
            .frame(width: screen.width)
            .background(Color(#colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)))
        }
    }
}

let noAuthPictures = [
    URL(string:
            "https://pic1.zhimg.com/80/" +
            "v2-ff31b17b57635aa705561adfb6584dca.jpg"),
    URL(string:
            "https://pic2.zhimg.com/80/" +
            "v2-9a0deec979308af696cdf8ab241cdae4.jpg"),
    URL(string:
            "https://pic1.zhimg.com/80/" +
            "v2-b25126bc0ca8044ed38e5d8601abd9f0.jpg"),
    URL(string:
            "https://pic1.zhimg.com/80/" +
            "v2-17d7e819323b64790bc5da7e6f14c59f.jpg"),
    URL(string:
            "https://pic2.zhimg.com/80/" +
            "v2-6752fb2a5040190f5cdb17f7566c4e18.jpg"),
    URL(string:
        "https://pic3.zhimg.com/80/" +
        "v2-2e5195c278e90f806b0733e6aac5b090.jpg"),
]

let noAuthPictures2 = [
    URL(string:
            "https://pic4.zhimg.com/80/" +
            "v2-949c1e4896a600f3c821c41895c056bc.jpg"),
    URL(string:
            "https://pic4.zhimg.com/80/" +
            "v2-2f1e12d98ce1d1b80e088f5b3304651d.jpg"),
    URL(string:
            "https://pic2.zhimg.com/80/" +
            "v2-17e0afb91a07c40b895bb6f1f8cda2e7.jpg"),
    URL(string:
            "https://pic1.zhimg.com/80/" +
            "v2-245f50ac36abda111e72074065860635.jpg"),
    URL(string:
            "https://pic2.zhimg.com/80/" +
            "v2-71c54db6038a4c57acf73799380c7d4d.jpg"),
    URL(string:
            "https://pic1.zhimg.com/80/" +
            "v2-f45de6c8604cb469f4d3aadeaa8f769a.jpg"),
]

struct RecyclePictureView: View {
    
    @State var items: [URL?] = []
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        WebImage(url: item)
                            .resizable()
                            .frame(
                                width: screen.width * 0.2,
                                height: screen.width * 0.2
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct NoLoginView: View {
    var body: some View {
        VStack(spacing: 10.0) {
            Text("想要体验更多功能请登录哦！")
                .padding(.bottom, 10)
                .foregroundColor(.orange)
            HStack {
                Text("羡慕别人的天空简直没道理，因为你是一座宇宙")
                    .foregroundColor(.purple)
            }
            RecyclePictureView(items: noAuthPictures)
            Divider()
                .padding(.horizontal)
            
            Text("下楼收了一个快递，是四月温暖的阳光”")
                .foregroundColor(.pink)
            RecyclePictureView(items: noAuthPictures2)
            
            Spacer(minLength: 0)
        }
    }
}
