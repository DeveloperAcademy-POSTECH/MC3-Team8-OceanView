//
//  AuthNicknameView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct AuthNicknameView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.Mytheme.onbardingBackgroundColor
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("앱에서 사용할")
                    Text("닉네임을 입력해 주세요.")
                }
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color.Mytheme.onbardingColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 63)
                
                //패스워드
                roundedFixedSizeColorBox(boxWidth: 357, boxHeight: 52, boxBackgroundColor: .white, boxForegroundColor: .clear, cornerRadius: 10, strokeColor: Color(hex: "5A66D6")) {
                    
                    TextField("", text: $viewModel.textNickname)
                        .placeholder(when: viewModel.textNickname.isEmpty, placeholder: {
                                Text("닉네임").foregroundColor(Color(hex: "5A66D6"))
                                    .keyboardType(.emailAddress)
                        })
                        .onChange(of: viewModel.textNickname) { newValue in
                            viewModel.nicknameCheckOnChange()
                        }.onSubmit {
                            viewModel.nicknameCheckOnChange()
                        }
                }
                .padding(.top, 16)
                .opacity(viewModel.textNickname.isEmpty ? 0.7 : 1)
                
                viewModel.duplicateNicnameDatabase()
                    .font(.callout)
                    .foregroundColor(viewModel.duplicateNicnameColorBool())
                    .padding(.top, 6)
                    
                NavigationLink {
                    AuthGenderView(viewModel: viewModel).navigationBarBackButtonHidden()
                } label: {
                    Text("다음으로")
                        .font(.system(size: 20))
                        .foregroundColor(!viewModel.textNickname.isEmpty && viewModel.isNicknameValid && viewModel.nicknameCheck(textNickname: viewModel.textNickname) ? Color.white : Color(hex: "989898"))
                        .frame(width: 360, height: 52)
                        .background(!viewModel.textNickname.isEmpty && viewModel.isNicknameValid && viewModel.nicknameCheck(textNickname: viewModel.textNickname) ? Color.Mytheme.onbardingColor: Color.white)
                        .cornerRadius(12)
                }
                .padding(.top, 393)
                .disabled(viewModel.textNickname.isEmpty || !viewModel.isNicknameValid || !viewModel.nicknameCheck(textNickname: viewModel.textNickname))
                
                Spacer()
            }
            .padding(.horizontal, 18)
            .navigationBarBackButtonHidden()
            .navigationBarTitle("닉네임 설정")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: {
                AuthPasswordView(viewModel: viewModel).navigationBarBackButtonHidden()
            }, label: {
                Image(systemName: "chevron.backward")
            }))
        }
    }
}

struct AuthNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        AuthNicknameView(viewModel: AuthViewModel())
    }
}
