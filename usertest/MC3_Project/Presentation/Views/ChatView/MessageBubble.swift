//
//  MessageBubble.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MessageBubble: View {
    // MARK: - Properties
    var message: Message
    @State var showTime = false
    @ObservedObject var mainModel: MainViewModel
    // 현재 인증된 사용자의 닉네임 가져오기

    
    // MARK: - Body
    var body: some View {
        VStack (spacing: 0){
            // 나의 채팅이면
            if (message.userName == mainModel.userInformation?.userName ?? "") {
                HStack (spacing: 0){
                    Spacer()
                    Text(message.userName)
                        .font(.system(size: 15, weight: .bold))
                    .padding(.horizontal, 12)
                    .foregroundColor(Color("Main01"))
                    WebImage(url: URL(string: message.profileImageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(width: 42)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 2))
                        
                } // HStack
                .padding(.bottom, 10)
                chatBubble(textString: message.text, textTime: "\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .onTapGesture {
                        showTime.toggle()
                    }
            } else { // 다른 사람의 채팅이면
                HStack (spacing: 0){
                    WebImage(url: URL(string: message.profileImageUrl))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(width: 42)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 2))
                    Text(message.userName)
                        .font(.system(size: 16, weight: .bold))
                        .padding(.horizontal, 12)
                        .foregroundColor(Color("Point01"))
                    Spacer()
                } // HStack
                .padding(.bottom, 10)
                
                chatBubble(textString: message.text, textTime: "\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        showTime.toggle()
                    }
            }
        } // VStack
        .padding(.horizontal, 15)
        .padding(.bottom, 20)
        }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "123", userName: "", text: "I gonna sleep", received: true, timestamp: Date(), profileImageUrl: ""), mainModel: MainViewModel())
    }
}
