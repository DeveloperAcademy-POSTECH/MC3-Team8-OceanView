//
//  AuthProfileView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct AuthProfileView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.Mytheme.onbardingBackgroundColor.ignoresSafeArea()
            VStack(alignment: .center, spacing: 3) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("프로필 사진을")
                    Text("등록해 주세요.")
                }
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color.Mytheme.onbardingColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 63)
                
                Text("사진을 통해 상대방에게 나를 알릴 수 있습니다.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                    .padding(.top, 8)
                
                VStack(alignment: .center) {
                    Button {
                        viewModel.isShowingImagePicker.toggle()
                    } label: {
                        ZStack(alignment: .center) {
                            if let profileImage = viewModel.profileImage {
                                Image(uiImage: profileImage)
                                    .resizable()
                                    .frame(width: 177, height: 177)
                                    .cornerRadius(20)
                                    .scaledToFill()
                                    .shadow(color: .black, radius: 1, x: 4, y: 4)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.black, lineWidth: 1)
                                        }
                                    } else {
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 177, height: 177)
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 1, x: 4, y: 4)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.black, lineWidth: 1)
                                                
                                                Image(systemName: "photo")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 45))
                                            }
                                    }
                        }
                        
                    }.padding(.horizontal, 90)
                        .sheet(isPresented: $viewModel.isShowingImagePicker) {
                            ImagePic(selectedImage: $viewModel.profileImage)
                        }
                        .padding(.top, 58)
                    
                    Text(viewModel.textNickname)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding(.top, 11)
                        .foregroundColor(viewModel.textGender == "남" ? Color.Mytheme.onbardingColor : Color.Mytheme.heartColor)
                }
                Spacer()
                
                NavigationLink(destination: OnboardingView(viewModel: viewModel).navigationBarBackButtonHidden(), tag: 1, selection: $viewModel.action) {
                    Button {
                        viewModel.registerUserAction()
                    } label: {
                        Text("회원가입 완료")
                            .font(.system(size: 20))
                            .foregroundColor(viewModel.profileImage != nil ? Color.white : Color(hex: "989898"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(viewModel.profileImage != nil ? Color.Mytheme.onbardingColor: Color.white)
                            .cornerRadius(12)
                    }
//                    .disabled(!(profileImage == nil))
                }
                .padding(.bottom, 71)
                
                
            }
            .padding(.horizontal, 18)
            .navigationBarBackButtonHidden()
            .navigationBarTitle("프로필 설정")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: {
                AuthGenderView(viewModel: viewModel).navigationBarBackButtonHidden()
            }, label: {
                Image(systemName: "chevron.backward")
            }))
        }
    }
}

struct AuthProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AuthProfileView(viewModel: AuthViewModel())
    }
}
