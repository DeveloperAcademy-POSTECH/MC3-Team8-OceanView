//
//  ChatHeaderView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/25.
//

import SwiftUI
import SDWebImageSwiftUI

//
//  ChatHeaderView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatListView: View {
    // MARK: - Properties
    @ObservedObject var mainModel: MainViewModel
    
    // This will hold the selected chat index when a chat is tapped
    @State private var selectedChatIndex: Int? = nil
    
    // MARK: - Preview
    var body: some View {
        NavigationView {
            ZStack {
                Image("ImgBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                
                // MARK: 중앙~하단의 채팅방 리스트들
                VStack(spacing: 0) {
                    ChatHeaderView(mainModel: mainModel)
                
                    NavigationLink {
                       Text("zzz")
                    } label: {
                        chatList(imageTitle: "IconChatList", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "AM 8:26")
                    }
                    .padding(.top, 16)
                    
                    Spacer()
                }
            }
        }
    }
}
  


struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView(mainModel: MainViewModel())
    }
}
