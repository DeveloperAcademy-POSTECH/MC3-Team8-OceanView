//
//  GroupChatView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct GroupChatView: View {
    @State var message: String = ""
    @State var missionTitle: String = "영일대에서 정장입고 수영하기"
    
    var body: some View {
        ZStack {
            Color("Main02").ignoresSafeArea()
            
            VStack (spacing: 0){
                // MARK: 화면 상단의 미션 안내
                roundedInfinityWidthBox(boxHeight: 40, boxBackgroundColor: "Point01") {
                    RoundedRectangle(cornerRadius: 4)
                        .inset(by: 1)
                        .stroke(.black, lineWidth: 2)
                        .overlay {
                            Text(missionTitle)
                                .foregroundColor(Color("GrayScale10"))
                                .font(Font.custom("Pretendard-Bold", size: 20))
                        }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 28)
                
                
                // MARK: 화면 중앙의 채팅들을 스크롤
                ScrollView{
                    VStack (spacing: 0){
                        Text("미션이 시작되었습니다.")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color("Main01"))
                        Text("새로운 우연과 미션을 수행해주세요")
                            .font(Font.custom("Pretendard-Bold", size: 13))
                            .foregroundColor(Color("Main01"))
                        
                        ChatYourBalloonView()
                        ChatMyBalloonView()
                        ChatYourBalloonView()
                        ChatMyBalloonView()
                        ChatYourBalloonView()
                        ChatMyBalloonView()
                    } // VStack
                } // ScrollView
                
                
                Spacer()
                // MARK: 화면 하단의 TextField 및 전송 버튼
                HStack (spacing: 0){
                    roundedInfinityWidthBox(boxHeight: 40, boxBackgroundColor: "GrayScale10") {
                        TextField("메세지를 입력하세요", text: $message)
                            .padding()
                    }
                    .padding(.horizontal, 16)
                    
                    roundedFixedSizeBox(boxWidth: 40, boxHeight: 40, boxBackgroundColor: "Main01") {
                        Button {
                            // action
                        } label: {
                            Text("💌")
                        }
                    }
                    .padding(.trailing, 16)
                } // HStack
                
            } // VStack
        } // ZStack
    }
}

struct GroupChatView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatView()
    }
}
