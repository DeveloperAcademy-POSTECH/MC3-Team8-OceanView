//
//  ChatViewBuilderViewBuilder.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

// MARK: ChatListView
// 채팅방 리스트에서 NavigationLink
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



// MARK: GroupChatView
// box의 height를 조절할 수 있는 Box width는 infinity, content에는 Box안의 내용이 들어감
@ViewBuilder
func roundedInfinityWidthBox<Content: View>
(boxHeight: CGFloat, boxBackgroundColor: String, @ViewBuilder content: () -> Content) -> some View {
    Rectangle()
        .foregroundColor(.clear)
        .frame(maxWidth: .infinity)
        .frame(height: boxHeight)
        .background(Color(boxBackgroundColor))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .inset(by: 1)
                .stroke(.black, lineWidth: 2)
                .overlay {
                    content()
                }
        )
    //.padding(.horizontal, 16)
    //.padding(.vertical, 10)
}


// box의 width와 height를 조절할 수 있는 Box, content에는 Box안의 내용이 들어감
@ViewBuilder
func roundedFixedSizeBox<Content: View>
(boxWidth: CGFloat, boxHeight: CGFloat, boxBackgroundColor: String, @ViewBuilder content: () -> Content) -> some View {
    Rectangle()
        .foregroundColor(.clear)
        .frame(width: boxWidth, height: boxHeight)
        .background(Color(boxBackgroundColor))
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .inset(by: 1)
                .stroke(.black, lineWidth: 2)
                .overlay {
                    content()
                }
        )
    //.padding(.horizontal, 16)
    //.padding(.vertical, 10)
}


// MARK: OthersMissionView
@ViewBuilder
func roundedFixedSizeImageBox<Content: View>
(boxWidth: CGFloat, boxHeight: CGFloat, boxBackgroundImage: String, @ViewBuilder content: () -> Content) -> some View {
    Rectangle()
        .foregroundColor(.clear)
        .frame(width: boxWidth, height: boxHeight)
        .background(Color("GrayScale01"))
        .cornerRadius(20)
        .overlay(
            Image(boxBackgroundImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .overlay {
                    content()
                }
        )
    //.padding(.horizontal, 16)
    //.padding(.vertical, 10)
}
