//
//  ChatHeaderView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/25.
//

import SwiftUI

struct ChatHeaderView: View {
    // MARK: - Properties
    @ObservedObject var mainModel: MainViewModel
   
    
    // MARK: - Body
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



struct ChatHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeaderView(mainModel: MainViewModel())
    }
}
