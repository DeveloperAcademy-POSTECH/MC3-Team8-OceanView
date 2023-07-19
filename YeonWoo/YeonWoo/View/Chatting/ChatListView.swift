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
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color("Point01"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: 1)
                            .stroke(.black, lineWidth: 2)
                            .overlay {
                                Text("채팅방")
                                    .foregroundColor(Color("GrayScale10"))
                                    .font(Font.custom("Pretendard-Bold", size: 20))
                            }
                    )
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                
                ScrollView {
                    chatList(imageTitle: "Imgprofile", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "AM 8:26")
                    chatList(imageTitle: "Imgprofile", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "PM 8:26")
                    chatList(imageTitle: "Imgprofile", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "AM 8:26")
                    chatList(imageTitle: "Imgprofile", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "AM 8:26")
                } // ScrollView
            } // VStack
            
        } // NavigationView
        .tint(.black)
        
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
