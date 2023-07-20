//
//  ChatBalloonView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct ChatBubbleView: View {
    var isMyChat: Bool
    var body: some View {
        VStack (spacing: 0){
            // 나의 채팅이면
            if isMyChat {
                HStack (spacing: 0){
                    Spacer()
                    Text("Puppy")
                        .font(.system(size: 15, weight: .bold))
                    .padding(.horizontal, 12)
                    .foregroundColor(Color("Main01"))
                    Image("Imgprofile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(width: 42)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 2))
                        
                } // HStack
                .padding(.bottom, 10)
                
                chatBubble(textString: "안녕하세요, 반갑습니다. 저는 여러분들과 행복한 한주를 보내고 싶어요. 인생이 뭔지 잘 모르겠어요. 제가 헤어지고 나서 2주 정도가 지난 것 같아요. 그러나 아직 제 마음은 뒤숭숭 하더라구요. 그래서 저는 여러분들과 새롭고 재미있는 미션을 하면서 친해지고 싶어요. 네? 여러분들도 그렇다고 한다면, 저 또한, 너무 좋아요.", textTime: "AM 08:26") .frame(maxWidth: .infinity, alignment: .trailing)
            } else { // 다른 사람의 채팅이면
                HStack (spacing: 0){
                    Image("Imgprofile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(width: 42)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.black, lineWidth: 2))
                    Text("Puppy")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.horizontal, 12)
                        .foregroundColor(Color("Point01"))
                    Spacer()
                } // HStack
                .padding(.bottom, 10)
                
                chatBubble(textString: "안녕하세요, 반갑습니다. 저는 여러분들과 행복한 한주를 보내고 싶어요. 인생이 뭔지 잘 모르겠어요. 제가 헤어지고 나서 2주 정도가 지난 것 같아요. 그러나 아직 제 마음은 뒤숭숭 하더라구요. 그래서 저는 여러분들과 새롭고 재미있는 미션을 하면서 친해지고 싶어요. 네? 여러분들도 그렇다고 한다면, 저 또한, 너무 좋아요.", textTime: "AM 08:26") .frame(maxWidth: .infinity, alignment: .leading)
            }
        } // VStack
        .padding(.horizontal, 15)
        .padding(.bottom, 20)
    }
}
struct ChatBalloonView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleView(isMyChat: true)
    }
}
