//
//  MissionCertificationView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct MissionCertificationView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Main02").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // MARK: 화면 상단의 미션 게시판 헤더
                    HStack (spacing: 0){
                        VStack (alignment: .leading, spacing: 0){
                            Text("미션 게시판")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("Point01"))
                            Text("수행했던 미션을 인증하고 공유해보세요.")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("GrayScale01"))
                        } // VStack - Text
                        Spacer()
                        makeShadowEffectCircle(ciecleSize: 64) {
                            Image("ImgProfile2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        }
                        
                    } // HStack
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .background(Color("Main02-2"))
                    
                    Divider()
                        .frame(minHeight: 3)
                        .background(Color.black)
                        .foregroundColor(.black)
                    
                    // MARK: 중앙~하단의 미션 인증 사진 리스트들
                    ScrollView {
                        ForEach(0..<10) { index in
                            MissionCardView()
                                .padding(.vertical, 16)
                        }
                    } // 위아래 ScrollView
                } // VStack
                
                Button {
                    // action
                } label: {
                    makeShadowEffectCircle(ciecleSize: 56) {
                        Image("IconPlusButton")
                    }
                }
                .position(x: UIScreen.main.bounds.width * 0.9, y: UIScreen.main.bounds.height * 0.75)
                
            } // ZStack
        } // NavigationView
        
        
    }
}

struct MissionCertificationView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCertificationView()
    }
}
