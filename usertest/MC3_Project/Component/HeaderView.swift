//
//  HeaderView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/21.
//

import SwiftUI
import Firebase
import SDWebImage
import SDWebImageSwiftUI

struct MissionHeaderView: View {
    
    @ObservedObject var mainModel: MainViewModel
    
    
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
                if let profileImage = mainModel.profileImage {
                    makeShadowEffectCircle(ciecleSize: 64) {
                        profileImage
                            .resizable()
                            .frame(width: 64, height: 64)
                    }
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

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeaderView(mainModel: MainViewModel())
    }
}
