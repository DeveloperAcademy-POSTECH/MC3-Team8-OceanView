//
//  LoginView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    @StateObject var viewModel = AuthViewModel()
    @StateObject var vm = ChaListViewModel()
    @StateObject var mainModel = MainViewModel()
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.Mytheme.onbardingBackgroundColor.ignoresSafeArea()
            VStack(alignment: .center, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("이메일과 패스워드를")
                    Text("입력해주세요.")
                }
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color.Mytheme.onbardingColor)
                .frame(maxWidth: .infinity,  alignment: .leading)
                //.padding(.horizontal, 16)
                .padding(.top, 63)
                
                // 이메일 입력란
                roundedFixedSizeColorBox(boxHeight: 52, boxBackgroundColor: .white, boxForegroundColor: .clear, cornerRadius: 10, strokeColor: Color(hex: "5A66D6")) {
                    TextField("", text: $viewModel.loginEmail)
                        .keyboardType(.emailAddress)
                        .placeholder(when: viewModel.loginEmail.isEmpty, placeholder: {
                                Text("Email@​email.com")
                                    .foregroundColor(Color(hex: "5A66D6"))
                        })
                }
                .opacity(viewModel.textEmail.isEmpty ? 0.7 : 1)
                .padding(.top, 16)
                
                // 비밀번호 입력란
                roundedFixedSizeColorBox( boxHeight: 52, boxBackgroundColor: .white, boxForegroundColor: .clear, cornerRadius: 10, strokeColor: Color(hex: "5A66D6")) {
                    SecureField("", text: $viewModel.loginPassword)
                        .keyboardType(.emailAddress)
                        .placeholder(when: viewModel.loginPassword.isEmpty, placeholder: {
                                Text("Password")
                                    .foregroundColor(Color(hex: "5A66D6"))
                        })
                }
                .opacity(viewModel.textEmail.isEmpty ? 0.7 : 1)
                .padding(.top, 12)
                
                
                if viewModel.LoginWarnig {
                    Text(" ")
                } else {
                    Text("아이디 혹은 비밀번호가 맞지 않습니다.")
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .underline()
                        .foregroundColor(Color.red)
                        .padding(.top, 4)
                    
                }
                
                Spacer()
                
                Button {
                    viewModel.login()
                    if viewModel.isActive == true {
                        viewModel.isValidEmailandPassword = true
                    } else {
                        viewModel.isValidEmailandPassword = false
                    }
                } label: {
                    Text("로그인 하기")
                        .font(.system(size: 20))
                        .foregroundColor(!viewModel.loginEmail.isEmpty || !viewModel.loginPassword.isEmpty ? Color.white : Color(hex: "989898"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(!viewModel.loginEmail.isEmpty || !viewModel.loginPassword.isEmpty ? Color.Mytheme.onbardingColor: Color.white)
                        .cornerRadius(12)
                }
                .disabled(viewModel.loginEmail.isEmpty || viewModel.loginPassword.isEmpty)
                .padding(.bottom, 71)
                //.padding(.bottom, keyboardHandler.keyboardHeight)
                
                NavigationLink("", isActive: $viewModel.isActive) {
                    MainTabView(mainModel: mainModel, vm: vm).navigationBarBackButtonHidden()
                }
               
            }
            
            .padding(.horizontal, 16)
            .navigationBarBackButtonHidden()
            .navigationTitle("로그인")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: {
                OnboardingView(viewModel: viewModel).navigationBarBackButtonHidden()
            }, label: {
                Image(systemName: "chevron.backward")
            }))
        }
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthViewModel())
    }
}
