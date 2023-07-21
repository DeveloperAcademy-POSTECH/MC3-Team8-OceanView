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
                makeShadowEffectRoundedRectangle(backgroundColor: "Point01") {
                    Text("“비오는 날 영일대에서 노래를 들으며, 키위먹고, 정장입고, 엉덩이 춤 추면서 수영하기”")
                        .foregroundColor(Color("GrayScale10"))
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.bottom, 15)
                .overlay {
                    makeShadowEffectRoundedRectangle2(backgroundColor: "GrayScale10", cornerRadius: 50) {
                        HStack{
                            Text(Image(systemName: "heart.fill"))
                                .foregroundColor(Color("Main01"))
                            
                            Text("Mission")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                    .offset(x: -115, y: -60)
                }
                
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


// content를 넣으면 cornerRadius가 큰 그림자를 가진 뷰를 그려줌
// mission을 그리기 위한 뷰빌더
@ViewBuilder
func makeShadowEffectRoundedRectangle2<Content: View>
(backgroundColor: String, cornerRadius: CGFloat, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        content()
            .padding(6)
            .frame(width: 96)
            .background(Color("GrayScale01"))
            .cornerRadius(cornerRadius)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .offset(x: 4, y: 4)
        
        content()
            .padding(6)
            .frame(width: 96)
            .background(Color(backgroundColor))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black, lineWidth: 2)
            )
        //.cornerRadius(cornerRadius)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
    }
}


struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView()
    }
}
