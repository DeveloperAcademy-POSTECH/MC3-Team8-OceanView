//
//  UploadPhotoView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct UploadPhotoView: View {
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
                
                // MARK: 중앙의 사진 업로드 버튼
                Button {
                    // action: 버튼을 클릭하면 사용자의 디바이스에서 사진을 선택
                    selectPhoto()
                } label: {
                    makeShadowEffectRoundedRectangle(backgroundColor: "GrayScale10") {
                        
                        VStack (spacing: 12){
                            Text(Image(systemName: "photo.artframe"))
                                .font(.system(size: 48))
                                .foregroundColor(Color("GrayScale01"))
                            
                            Text("사진을 업로드 해주세요")
                                .foregroundColor(Color("GrayScale07"))
                                .font(.system(size: 12, weight: .semibold))
                        }
                        
                        .frame(height: 331)
                    }
                }
                Spacer()
            } // VStack
            .padding(.horizontal, 20)
            
            // MARK: 화면 가장 하단의 업로드 버튼
            Button {
                // action: 파이어베이스에 사진 업로드 기능 구현
                uploadPhoto()
            } label: {
                makeShadowEffectCircle(ciecleSize: 56) {
                    Image("IconUpload")
                }
            }
            .position(x: UIScreen.main.bounds.width * 0.9, y: UIScreen.main.bounds.height * 0.74)
        } // ZStack
    }
    
    // TODO: 디바이스에 저장된 사진 선택
    func selectPhoto() {
        
    }
    
    // TODO: 디바이스에 저장된 사진을 업로드하는 로직 필요
    func uploadPhoto() {
        
    }
}




struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView()
    }
}
