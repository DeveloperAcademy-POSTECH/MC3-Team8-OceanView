//
//  HeaderView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/21.
//

import SwiftUI
import Firebase


struct ChatHeaderView: View {
    var body: some View {
        // MARK: 화면 상단의 채팅방 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 8){
                    Text("채팅방")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("Point01"))
                    Text("사람들과 자유롭게 미션을 진행하세요.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                makeShadowEffectCircleProfile(ciecleSize: 64) {
                    Image("ImgProfile2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
            } // HStack
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
            .background(Color("Main02-2"))
            Divider()
                .frame(minHeight: 2)
                .background(Color.black)
                .foregroundColor(.black)
        }
    }
}


struct MissionHeaderView: View {
    var body: some View {
        // MARK: 화면 상단의 미션 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 8){
                    Text("미션 게시판")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("Point01"))
                    Text("수행했던 미션을 인증하고 공유해보세요.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                makeShadowEffectCircleProfile(ciecleSize: 64) {
                    Image("ImgProfile2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
            } // HStack
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
            .background(Color("Main02-2"))
            Divider()
                .frame(minHeight: 2)
                .background(Color.black)
                .foregroundColor(.black)
        }
    }
}

struct HeartHeaderView: View {
    var body: some View {
        // MARK: 화면 상단의 미션 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 8){
                    Text("하트")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("Point01"))
                    Text("하트로 연결된 상대틀 확인해 보세요!")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                makeShadowEffectCircleProfile(ciecleSize: 64) {
                    Image("ImgProfile2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
            } // HStack
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
            .background(Color("Main02-2"))
            Divider()
                .frame(minHeight: 2)
                .background(Color.black)
                .foregroundColor(.black)
        }
    }
}

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeaderView()
        MissionHeaderView()
        HeartHeaderView()
    }
}
