//
//  UploadPhotoView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct UploadPhotoView: View {
    
    @ObservedObject var mainModel: MainViewModel
    @ObservedObject var vm : ChaListViewModel
    
    var body: some View {
        ZStack {
            Color("Main02").ignoresSafeArea()
            VStack (spacing: 0){
                // MARK: 상단의 미션 사진 업로드 헤더
                makeShadowEffectRoundedRectangle(backgroundColor: "Point01") {
                    Text("인증 사진 업로드")
                        .foregroundColor(Color("GrayScale10"))
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.bottom, 30)
                
                // MARK: 화면 중앙의 미션 정보
                MissionInfoView()
                    .padding(.bottom, 12)
                
                
                // MARK: 중앙의 사진 업로드 버튼
                Button {
                    mainModel.missionImageUpload.toggle()
                } label: {
                    if let profileImage = mainModel.missionProfileImage {
                        
                        makeShadowEffectRoundedRectangle(backgroundColor: "GrayScale10") {
                            Image(uiImage: profileImage)
                                .resizable()
                                //.scaledToFill()
                            .aspectRatio(contentMode: .fit)
                                .frame(height: 331)
                        }
                    } else {
                        makeShadowEffectRoundedRectangle(backgroundColor: "GrayScale10") {
                            
                            VStack (spacing: 12){
                                Text(Image(systemName: "photo"))
                                    .font(.system(size: 48))
                                    .foregroundColor(Color("GrayScale01"))
                                
                                Text("사진을 업로드 해주세요")
                                    .foregroundColor(Color("GrayScale07"))
                                    .font(.system(size: 12, weight: .semibold))
                            }
                            
                            .frame(height: 331)
                        }
                    } //else
                }
                .sheet(isPresented: $mainModel.missionImageUpload) {
                    ImagePic(selectedImage: $mainModel.missionProfileImage)
                }
                
                Spacer()
            } // VStack
            .padding(.horizontal, 20)
            
            // MARK: 화면 가장 하단의 업로드 버튼
            NavigationLink {
                MainTabView(mainModel: mainModel, vm: vm).tag(3).navigationBarBackButtonHidden()
                    .onAppear {
                        mainModel.isMission = true
                    }
            } label: {
                makeShadowEffectCircle(ciecleSize: 56) {
                    Image("IconUpload")
                }
            }
            .position(x: UIScreen.main.bounds.width * 0.9, y: UIScreen.main.bounds.height * 0.74)
        } // ZStack
        .navigationBarBackButtonHidden()
    }
}




struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView(mainModel: MainViewModel(), vm: ChaListViewModel())
    }
}
