//
//  ChatViewBuilderViewBuilder.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

@ViewBuilder
func chatList
(imageTitle: String, missionTitle: String, lastChat: String, timeInfo: String) -> some View {
    RoundedRectangle(cornerRadius: 4)
        .foregroundColor(.white)
        .shadow(color: .black, radius: 1, x: 4, y: 4)
        .frame(maxWidth: .infinity)
        .frame(height: 72)
        .overlay {
            NavigationLink {
                // destination
                GroupChatView()
            } label: {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.black, lineWidth: 1)
                    .overlay {
                        HStack (alignment: .top, spacing: 0) {
                            Image(imageTitle)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .frame(width: 42)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.black, lineWidth: 2))
                                .padding(.horizontal, 19)
                            VStack (alignment: .leading,spacing: 0){
                                Text(missionTitle)
                                    .font(
                                        Font.custom("Pretendard-Bold", size: 15)
                                    )
                                    .padding(.bottom, 5)
                                
                                Text(lastChat)
                                    .lineLimit(1)
                                    .foregroundColor(Color("GrayScale06"))
                                    .font(
                                        Font.custom("Pretendard-Medium", size: 12)
                                    )
                            } // VStack
                            .padding(.leading, 3)
                            Spacer()
                            Text(timeInfo)
                                .foregroundColor(Color("GrayScale07"))
                                .font(
                                    Font.custom("Pretendard-Medium", size: 10)
                                )
                                .padding(.horizontal, 15)
                        }
                    }
            } // NavigationLink
            
        } // overlay
        .padding(.horizontal, 16)
}
