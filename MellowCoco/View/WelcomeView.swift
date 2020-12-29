//
//  LoginView.swift
//  MellowCoco
//
//  Created by hhhhh on 2020/12/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
            ZStack {
                LinearGradient(
                        gradient: .init(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)
                
                if screen.height > 800 {
                    HomeView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        HomeView()
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    HomeView()
                }
            }
        }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

struct HomeView: View {
    @State var index = 0
    
    var body: some View {
        VStack {
            Image("illustration12")
                .resizable()
                .frame(width: 200, height: 200)
            
            HStack {
                Button(action: {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                        self.index = 0
                    }
                }) {
                    Text("登录")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }
                .background(self.index == 0 ? Color.white : Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                    withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)) {
                        self.index = 1
                    }
                }) {
                    Text("注册")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }
                .background(self.index == 1 ? Color.white : Color.clear)
                .clipShape(Capsule())
            }
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            .padding(.top, 25)
            
            if self.index == 0 {
                LoginView()
            } else {
                SignupView()
            }
            
            if self.index == 0 {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("忘记密码？")
                        .foregroundColor(.white)
                })
                .padding(.top, 20)
            }
            
            HStack(spacing: 15.0) {
                Color.white.opacity(0.7)
                    .frame(width: 35, height: 1)
                
                Text("其它方式")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Color.white.opacity(0.7)
                    .frame(width: 35, height: 1)
                
            }
            .padding(.top, 10)
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("qq")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(5)
                })
                .background(Color.white)
                .clipShape(Circle())
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("wechat")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(5)
                })
                .background(Color.white)
                .clipShape(Circle())
                .padding(.leading, 25)
            }
            .padding(.top, 10)
        }
        .padding()
    }
}

struct LoginView : View {
    @State var username = ""
    @State var password = ""
    @State var showAlert = false
    @State var alertMessage = "出错了"
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var user: UserViewModel
    
    var body : some View {
        VStack {
            VStack {
                HStack(spacing: 15) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    TextField("用户名/手机号", text: self.$username)
                }
                .padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    SecureField("密码", text: self.$password)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 20)
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
        }
        
        Button(action: {
            self.user.login(username: username, password: password)
            
            if self.user.isLogged {
                self.username = ""
                self.password = ""
                self.presentationMode.wrappedValue.dismiss()
            }
            else {
                self.showAlert = true
                self.alertMessage = "用户名或密码错误"
            }
            
        }) {
            Text("登录")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 100)
        }
        .background(
            LinearGradient(
                gradient: .init(colors: [Color(#colorLiteral(red: 0.9803921569, green: 0.4862745098, blue: 0.7333333333, alpha: 1)), Color(#colorLiteral(red: 0.9450980392, green: 0.2745098039, blue: 0.3450980392, alpha: 1))]),
                startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/,
                endPoint: .trailing)
        )
        .cornerRadius(8)
        .offset(y: -40)
        .padding(.bottom, -40)
        .shadow(radius: 15)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("错误"), message: Text(self.alertMessage), dismissButton: .default(Text("确定")))
        })
    }
}

struct SignupView : View {
    @State var username = ""
    @State var password = ""
    @State var repassword = ""
    
    var body : some View {
        VStack {
            VStack {
                HStack(spacing: 15) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    TextField("邮箱/手机号", text: self.$username)
                }
                .padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    SecureField("密码", text: self.$password)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    SecureField("确认密码", text: self.$repassword)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                }
                .padding(.vertical, 20)
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
        }
        
        Button(action: {
            
        }) {
            Text("注册")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 100)
        }
        .background(
            LinearGradient(
                gradient: .init(colors: [Color(#colorLiteral(red: 0.9803921569, green: 0.4862745098, blue: 0.7333333333, alpha: 1)), Color(#colorLiteral(red: 0.9450980392, green: 0.2745098039, blue: 0.3450980392, alpha: 1))]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            )
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
    }
}
