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
                
                
                VStack (spacing: 0){
                    // MARK: 화면 상단의 채팅방 헤더
                    ChatHeaderView()
                    
                    
                    // MARK: 중앙~하단의 채팅방 리스트들
                    ScrollView {
                        ForEach(0..<10) { index in
                            // MARK: 각각의 NavigationLink를 좌측으로 Drag했을때 삭제할 수 있는 코드 필요
                            // linelimt 설정
                            chatList(imageTitle: "Imgprofile", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "AM 8:26")
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
