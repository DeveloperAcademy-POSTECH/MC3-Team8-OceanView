//
//  AuthGenderView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct AuthGenderView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.Mytheme.onbardingBackgroundColor.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("성별은")
                    Text("어떻게 되시나요?")
                }
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color.Mytheme.onbardingColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 63)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        ZStack(alignment: .top) {
                            ZStack(alignment: .center){
                                
                                Button {
                                    viewModel.isActivatedGender = true
                                    viewModel.textGender = "남"
                                    viewModel.isGenderValid = true
                                    
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame(width: 177, height: 220)
                                            .foregroundColor(Color(hex: "C3C3F9"))
                                            .opacity(viewModel.isActivatedGender ? 1 : 0.5)
                                        
                                        Image("BackgroundRemoveBoy")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 177, height: 220)
                                            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                                            .opacity(viewModel.isActivatedGender ? 1 : 0.5)
                                    }
                                }
                            }
                            
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width: 177, height: 28)
                                    .cornerRadius(16, corners: [.topLeft, .topRight])
                                    .foregroundColor(Color.Mytheme.onbardingColor)
                                    .opacity(viewModel.isActivatedGender ? 1 : 0.5)
                                
                                
                                Text("남자")
                                    .font(.system(size: 16))
                                    .padding(.leading, 19)
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                                
                            }
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.Mytheme.onbardingColor, lineWidth: 2)
                                .opacity(viewModel.isActivatedGender ? 1 : 0.5)
                            
                        }
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        ZStack(alignment: .top) {
                            ZStack(alignment: .center){
                                
                                Button {
                                    viewModel.isActivatedGender = false
                                    viewModel.textGender = "여"
                                    viewModel.isGenderValid = true
                                    
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame(width: 177, height: 220)
                                            .foregroundColor(Color(hex: "FFD2FA"))
                                            .opacity(viewModel.isActivatedGender ? 0.5 : 1)
                                        
                                        Image("BackgroundRemoveGirl")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 177, height: 220)
                                            .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                                            .opacity(viewModel.isActivatedGender ? 0.5 : 1)
                                    }
                                }
                            }
                            
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width: 177, height: 28)
                                    .cornerRadius(16, corners: [.topLeft, .topRight])
                                    .foregroundColor(Color.Mytheme.heartColor)
                                    .opacity(viewModel.isActivatedGender ? 0.5 : 1)
                                
                                Text("여자")
                                    .font(.system(size: 16))
                                    .padding(.leading, 19)
                                    .foregroundColor(Color.white)
                                    .fontWeight(.bold)
                            }
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.Mytheme.heartColor, lineWidth: 2)
                                .opacity(viewModel.isActivatedGender ? 0.5 : 1)
                            
                        }
                    }
                    
                }
                .padding(.top, 120)
                
                NavigationLink {
                    AuthProfileView(viewModel: viewModel)
                } label: {
                    Text("다음으로")
                        .font(.system(size: 20))
                        .foregroundColor(viewModel.isGenderValid ? Color.white : Color(hex: "989898"))
                        .frame(width: 360, height: 52)
                        .background(viewModel.isGenderValid ? Color.Mytheme.onbardingColor: Color.white)
                        .cornerRadius(12)
                        
                }
                .disabled(!viewModel.isGenderValid)
                .padding(.top, 150)
                
                Spacer()
            }
            .padding(.horizontal, 18)
            .navigationBarBackButtonHidden()
            .navigationBarTitle("성별 설정")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: {
                AuthNicknameView(viewModel: viewModel).navigationBarBackButtonHidden()
            }, label: {
                Image(systemName: "chevron.backward")
            }))
        }
    }
}

struct AuthGenderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthGenderView(viewModel: AuthViewModel())
    }
}
