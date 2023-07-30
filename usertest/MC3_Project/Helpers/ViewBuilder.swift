//
//  ChatViewBuilderViewBuilder.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

// MARK: 모든 뷰에서 쓰임
// MARK: Shadow를 주는 Box
// content에 네모 안에 들어갈 것을 넣으면, shadow효과를 주는 View를 반환해줌
@ViewBuilder
func makeShadowEffectRoundedRectangle<Content: View>
(backgroundColor: String, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        content()
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color("GrayScale01"))
            .cornerRadius(16)
            //.shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .offset(x: 2, y: 2)
            .opacity(0.9)
        
        content()
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color(backgroundColor))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 4)
            )
            .cornerRadius(16)
            //.shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
    }
}


// content를 넣으면 cornerRadius를 지정할 수 있는 큰 그림자를 가진 뷰를 그려줌
// mission, 채팅방 이동을 그리기 위한 뷰빌더
@ViewBuilder
func makeShadowEffectRoundedRectangle2<Content: View>
(backgroundColor: String, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        content()
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color("GrayScale01"))
            .cornerRadius(4)
            .offset(x: 2, y: 2)
            .opacity(0.9)
        
        content()
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color(backgroundColor))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: 2)
            )
            .cornerRadius(4)
    }
}



// content를 넣으면 cornerRadius를 지정할 수 있는 큰 그림자를 가진 뷰를 그려줌
// mission, 채팅방 이동을 그리기 위한 뷰빌더
@ViewBuilder
func makeShadowEffectRoundedRectangle3<Content: View>
(backgroundColor: String, cornerRadius: CGFloat, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        content()
            .padding(6)
            .frame(width: 96, height: 32)
            .background(Color("GrayScale01"))
            .cornerRadius(cornerRadius)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .offset(x: 4, y: 4)
        
        content()
            .padding(6)
            .frame(width: 96, height: 32)
            .background(Color(backgroundColor))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black, lineWidth: 1)
            )
        //.cornerRadius(cornerRadius)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
    }
}


// 프로필 이미지를 만들어주는 ViewBuilder
// 원의 선이 없고, shadow가 있는 viewbuilder
@ViewBuilder
func makeShadowEffectCircleProfile<Content: View>
(ciecleSize: CGFloat, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        Circle()
            .frame(width: ciecleSize)
            .foregroundColor(Color.black)
            .offset(x: 0.5, y: 1.5)
            .opacity(0.9)
        
        content()
            .overlay(
                Circle()
                    .stroke(Color.black, lineWidth: 0)
            )
            .cornerRadius(50)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .frame(width: ciecleSize)
    }
}

// 프로필 이미지를 만들어주는 ViewBuilder
// 원의 선, shadow가 있는 viewbuilder
@ViewBuilder
func makeShadowEffectCircleProfile2<Content: View>
(ciecleSize: CGFloat, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        Circle()
            .frame(width: ciecleSize)
            .foregroundColor(Color.black)
            .offset(x: 0.5, y: 1.5)
            .opacity(0.9)
        
        content()
            .overlay(
                Circle()
                    .stroke(Color.black, lineWidth: 2)
            )
            .cornerRadius(50)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .frame(width: ciecleSize)
    }
}

// 동그란 버튼의 shadow를 만들어주는 ViewBuilder
@ViewBuilder
func makeShadowEffectCircle<Content: View>
(ciecleSize: CGFloat, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        Circle()
            .frame(width: ciecleSize)
            .foregroundColor(Color.black)
            .offset(x: 3, y: 3)
            .opacity(0.9)
        
        content()
            .overlay(
                Circle()
                    .stroke(Color.black, lineWidth: 4)
            )
            .cornerRadius(50)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .frame(width: ciecleSize)
    }
}



// MARK: Shadow가 없는 Box
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


// box의 width와 height를 조절할 수 있는 Box, content에는 Box안의 내용이 들어감
@ViewBuilder
func roundedFixedSizeColorBox<Content: View>
(boxWidth: CGFloat, boxHeight: CGFloat, boxBackgroundColor: Color, boxForegroundColor: Color, cornerRadius: CGFloat, strokeColor: Color, @ViewBuilder content: () -> Content) -> some View {
    Rectangle()
        .foregroundColor(boxForegroundColor)
        .frame(width: boxWidth, height: boxHeight)
        .background(boxBackgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: 1)
                .stroke(strokeColor, lineWidth: 2)
                .overlay {
                    content()
                        .font(.system(size: 20))
                        .autocapitalization(.none)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                        .fontWeight(.bold)
                }
        )
    //.padding(.horizontal, 16)
    //.padding(.vertical, 10)
}


// box의 width와 height를 조절할 수 있는 Box, content에는 Box안의 내용이 들어감
@ViewBuilder
func roundedInfinityColorBox<Content: View>
(boxHeight: CGFloat, boxBackgroundColor: Color, boxForegroundColor: Color, cornerRadius: CGFloat, strokeColor: Color, @ViewBuilder content: () -> Content) -> some View {
    Rectangle()
        .foregroundColor(boxForegroundColor)
        .frame(height: boxHeight)
        .frame(maxWidth: .infinity)
        .background(boxBackgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: 1)
                .stroke(strokeColor, lineWidth: 2)
                .overlay {
                    content()
                        .font(.system(size: 20))
                        .autocapitalization(.none)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                        .fontWeight(.bold)
                }
        )
    //.padding(.horizontal, 16)
    //.padding(.vertical, 10)
}




// MARK: 이미지를 넣으면 shadow를 주는 View를 반환해줌
@ViewBuilder
func roundedFixedSizeImageBox
(imgaeTitle: String,boxWidth: CGFloat, boxHeight: CGFloat) -> some View {
    ZStack (alignment: .trailing){
        Rectangle()
            .frame(width: boxWidth, height: boxHeight)
            .background(Color("GrayScale01"))
            .cornerRadius(16)
            .offset(x: 2, y: 2)
            .opacity(0.9)
        
        Image(imgaeTitle)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: boxWidth, height: boxHeight)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}


// MARK: ChatListView
// 채팅방 리스트 - NavigationLink로 채팅방 연결
@ViewBuilder
func chatList
(imageTitle: String, missionTitle: String, lastChat: String, timeInfo: String) -> some View {
    NavigationLink {
        // destination
        //GroupChatView()
    } label: {
        makeShadowEffectRoundedRectangle2 (backgroundColor: "GrayScale10") {
            HStack (alignment: .center, spacing: 0) {
                // 가장 왼쪽의 하트 이미지
                makeShadowEffectCircle(ciecleSize: 42) {
                    Image("Imgprofile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
                .padding(.trailing, 16)
                
                VStack (alignment: .leading,spacing: 0){
                    Text(missionTitle)
                        .foregroundColor(Color("GrayScale02"))
                        .font(
                            Font.custom("Pretendard-Bold", size: 16)
                        )
                        .padding(.bottom, 5)
                    
                    Text(lastChat)
                        .lineLimit(1)
                        .foregroundColor(Color("GrayScale07"))
                        .font(
                            Font.custom("Pretendard-Medium", size: 12)
                        )
                } // VStack
                .padding(.leading, 3)
                Spacer()
                Text(timeInfo)
                    .foregroundColor(Color("GrayScale05"))
                    .font(
                        Font.custom("Pretendard-Medium", size: 12)
                    )
            } // HStack
        } // makeShadowEffectRoundedRectangle
        .padding(.horizontal, 16)
        .padding(.bottom, 0)
    }
}


// MARK: GroupChatView
// 채팅방 버블 - 채팅방의 대화 내용을 담고 있는 Bubble -> textString, textTime만 전달해주면 됨
@ViewBuilder
func chatBubble
(textString: String, textTime: String) -> some View {
    copyChatBoxView {
        VStack (alignment: .leading){
            Text(textString)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("GrayScale01"))
                .font(.system(size: 14))
                .lineLimit(20)
                .padding(.bottom, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack (spacing: 0){
                Spacer()
                Text(textTime)
                    .foregroundColor(Color("GrayScale07"))
                    .font(.system(size: 10))
            }
        }
    }
}


// 채팅방의 버블 - 채팅방의 버블의 그림자를 주는 효과
@ViewBuilder
func copyChatBoxView<Content: View>
(content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        content()
            .padding(16)
            .background(Color.black)
            .cornerRadius(4)
            .frame(width: UIScreen.main.bounds.width*0.67)
            .offset(x: 3, y: 3)
            .opacity(0.9)
        
        content()
            .padding(16)
            .background(Color("GrayScale10"))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.black, lineWidth: 4)
            )
            .cornerRadius(4)
            .frame(width: UIScreen.main.bounds.width*0.67)
    }
}




// box의 width와 height를 조절할 수 있는 Box, content에는 Box안의 내용이 들어감
@ViewBuilder
func roundedFixedSizeColorBox<Content: View>
(boxHeight: CGFloat, boxBackgroundColor: Color, boxForegroundColor: Color, cornerRadius: CGFloat, strokeColor: Color, @ViewBuilder content: () -> Content) -> some View {
    Rectangle()
        .foregroundColor(boxForegroundColor)
        .frame(height: boxHeight)
        .frame(maxWidth: .infinity)
        .background(boxBackgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: 1)
                .stroke(strokeColor, lineWidth: 2)
                .overlay {
                    content()
                        .font(.system(size: 20))
                        .autocapitalization(.none)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 6))
                        .fontWeight(.bold)
                }
        )
    //.padding(.horizontal, 16)
    //.padding(.vertical, 10)
}

