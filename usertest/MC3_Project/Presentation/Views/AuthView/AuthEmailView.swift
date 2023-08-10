//
//  ContentView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/21.
//

import SwiftUI

struct AuthEmailView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
            VStack{
                ZStack {
                    Color.Mytheme.onbardingBackgroundColor.ignoresSafeArea()
                    
                    VStack(alignment: .center, spacing: 0) {
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text("환영합니다.")
                            Text("이메일을 입력해주세요.")
                        }
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color.Mytheme.onbardingColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 63)
                        
                        roundedFixedSizeColorBox(boxHeight: 52, boxBackgroundColor: .white, boxForegroundColor: .clear, cornerRadius: 10, strokeColor: Color(hex: "5A66D6")) {
                            TextField("", text: $viewModel.textEmail)
                                .placeholder(when: viewModel.textEmail.isEmpty, placeholder: {
                                        Text("Email@​email.com").foregroundColor(Color(hex: "5A66D6"))
                                            .keyboardType(.emailAddress)
                                })
                                .onChange(of: viewModel.textEmail){ newValue in
                                        viewModel.onChangeValidEamil()
                                    
                                }
                                .onSubmit {
                                        viewModel.onChangeValidEamil()
                                }
                        }
                        .opacity(viewModel.textEmail.isEmpty ? 0.7 : 1)
                        .padding(.top, 16)
                        
                        Text("가입을 위한 이메일을 입력해주세요.")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "989898"))
                            .underline()
                            .padding(.top, 4)
                        
                        viewModel.validEmailButton()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        NavigationLink {
                            AuthPasswordView(viewModel: viewModel).navigationBarBackButtonHidden()
                        } label: {
                            Text("다음")
                                .font(.system(size: 20))
                                .foregroundColor(viewModel.isValidEmail(testStr: viewModel.textEmail) == true && viewModel.emailCheck(email: viewModel.textEmail) == true ? Color.white : Color(hex: "989898"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 52)
                                .background(viewModel.isValidEmail(testStr: viewModel.textEmail) == true && viewModel.emailCheck(email: viewModel.textEmail) == true ? Color.Mytheme.onbardingColor: Color.white)
                                .cornerRadius(12)
                        }
                        .disabled(viewModel.textEmail.isEmpty || !viewModel.isEmailWarining || !viewModel.isEmailduplicationID)
                        .padding(.bottom, 71)

                        
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("회원가입 진행")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: {
                OnboardingView(viewModel: viewModel).navigationBarBackButtonHidden()
            }, label: {
                Image(systemName: "chevron.backward")
            }))
    }
}

// MARK: - Preview
struct AuthEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AuthEmailView(viewModel: AuthViewModel())
    }
}
