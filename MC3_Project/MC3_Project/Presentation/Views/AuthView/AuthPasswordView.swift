//
//  AuthPasswordView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/21.
//

import SwiftUI

struct AuthPasswordView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.Mytheme.onbardingBackgroundColor
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("환영합니다.")
                    Text("패스워드를 입력해주세요.")
                }
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color.Mytheme.onbardingColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 63)
                
                //패스워드
                roundedFixedSizeColorBox(boxWidth: 357, boxHeight: 52, boxBackgroundColor: .white, boxForegroundColor: .clear, cornerRadius: 10, strokeColor: Color(hex: "5A66D6")) {
                    
                    SecureField("", text: $viewModel.textPassword)
                        .placeholder(when: viewModel.textPassword.isEmpty, placeholder: {
                                Text("Password").foregroundColor(Color(hex: "5A66D6"))
                                    .keyboardType(.emailAddress)
                        })
                        .onChange(of: viewModel.textPassword) { newValue in
                            viewModel.passwordCheck()
                        }.onSubmit {
                            viewModel.passwordCheck()
                        }
                }
                .padding(.top, 16)
                .opacity(viewModel.textPassword.isEmpty ? 0.7 : 1)
                
                viewModel.passwordWarning()
                    .underline()
                    .font(.callout)
                    .foregroundColor((viewModel.isPasswordWarining || viewModel.textPassword == "") ? Color(hex: "989898") : Color.red)
                    .padding(.top, 6)
                
                // 패스워드 확인
                roundedFixedSizeColorBox(boxWidth: 357, boxHeight: 52, boxBackgroundColor: .white, boxForegroundColor: .clear, cornerRadius: 10, strokeColor: Color(hex: "5A66D6")) {
                    
                    SecureField("", text: $viewModel.textPasswordChecked)
                        .placeholder(when: viewModel.textPasswordChecked.isEmpty, placeholder: {
                                Text("Password").foregroundColor(Color(hex: "5A66D6"))
                                    .keyboardType(.emailAddress)
                        })
                        .onChange(of: viewModel.textPassword) { newValue in
                            viewModel.passwordCheck()
                        }.onSubmit {
                            viewModel.passwordCheck()
                        }
                    
                }
                .padding(.top, 12)
                .opacity(viewModel.textPasswordChecked.isEmpty ? 0.7 : 1)
                
                viewModel.passwordCheckWarning()
                    .underline()
                    .font(.callout)
                    .foregroundColor(viewModel.passwordCheckColor() ? Color(hex: "989898") : Color.red)
                    .padding(.top, 6)
                
                
                NavigationLink {
                    AuthNicknameView(viewModel: viewModel).navigationBarBackButtonHidden()
                } label: {
                    Text("다음으로")
                        .font(.system(size: 20))
                        .foregroundColor(viewModel.isPasswordValid && viewModel.textPassword == viewModel.textPasswordChecked ? Color.white : Color(hex: "989898"))
                        .frame(width: 360, height: 52)
                        .background(viewModel.isPasswordValid && viewModel.textPassword == viewModel.textPasswordChecked ? Color.Mytheme.onbardingColor: Color.white)
                        .cornerRadius(12)
                }
                .padding(.top, 315)
                .disabled(!viewModel.isPasswordValid || !(viewModel.textPassword == viewModel.textPasswordChecked))

                
                Spacer()
            }.padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("회원가입 진행")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: NavigationLink(destination: {
            AuthEmailView(viewModel: viewModel).navigationBarBackButtonHidden()
        }, label: {
            Image(systemName: "chevron.backward")
        }))
    }
}

struct AuthPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AuthPasswordView(viewModel: AuthViewModel())
    }
}
