//
//  ChatListView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct ChatListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("ImgBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                
                // MARK: 화면 상단의 채팅방 헤더
                VStack (spacing: 0){
                    HStack (spacing: 0){
                        VStack (alignment: .leading, spacing: 0){
                            Text("채팅방")
                                .font(.system(size: 20, weight: .light))
                                .foregroundColor(Color("Point01"))
                            Text("사람들과 자유롭게 미션을 진행하세요.")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("GrayScale01"))
                        } // VStack - Text
                        Spacer()
                        makeShadowEffectCircle(ciecleSize: 64) {
                            Image("Imgprofile")
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
                    
                    
                    // MARK: 중앙~하단의 채팅방 리스트들
                    ScrollView {
                        ForEach(0..<10) { index in
                            // MARK: 각각의 NavigationLink를 좌측으로 Drag했을때 삭제할 수 있는 코드 필요
                            chatList(imageTitle: "IconChatList", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "AM 8:26")
                        }
                    } // ScrollView
                    .padding(.top, 16)
                } // VStack
            } // ZStack
        } // NavigationView
        .tint(.black)
        
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
