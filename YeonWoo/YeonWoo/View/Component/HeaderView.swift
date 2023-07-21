//
//  HeaderView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/21.
//

import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        // MARK: 화면 상단의 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 0){
                    HStack (spacing: 0){
                        Text("'Ocean'")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("Point01"))
                        Text("님")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color("GrayScale01"))
                    }
                    
                    Text("오늘의 우연을 만나보세요")
                        .font(.system(size: 20, weight: .regular))
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
        }
    }
}


struct ChatHeaderView: View {
    var body: some View {
        // MARK: 화면 상단의 채팅방 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 0){
                    Text("채팅방")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("Point01"))
                    Text("사람들과 자유롭게 미션을 진행하세요.")
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
        }
    }
}


struct MissionHeaderView: View {
    var body: some View {
        // MARK: 화면 상단의 채팅방 헤더
        // MARK: 화면 상단의 헤더
        VStack (spacing: 0){
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
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView()
        ChatHeaderView()
        MissionHeaderView()
    }
}
