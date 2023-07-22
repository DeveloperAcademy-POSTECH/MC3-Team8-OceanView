//
//  HomeMatchedView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/22.
//

import SwiftUI

struct HomeMatchedView: View {
    var remainDate: Int = 196
    @State var isClicked: Bool = false
    var body: some View {
        ZStack {
            VStack (spacing: 16){
                roundedFixedSizeImageBox(imgaeTitle: "ImgMainCard", boxWidth: 361, boxHeight: 524)
                    .overlay(
                        VStack(alignment: .leading, spacing: 4){
                            HStack (spacing: 8){
                                Text("아카데미 수료까지")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(Color("Main01"))
                                Text("\(remainDate)일")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(Color("GrayScale10"))
                            }
                            Text("러너들의 새로운 우연이 이루어지길 기다리고 있어요!")
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(Color("GrayScale10"))
                            Spacer()
                        }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(16)
                        
                    )
                
                makeShadowEffectRoundedRectangle(backgroundColor: "Main02-2") {
                    Button {
                        // action: 랜덤 매칭 로직 필요
                        isClicked.toggle()
                    } label: {
                        Text(isClicked ? "매칭 진행 중..." : "새로운 우연 만나기")
                            .foregroundColor(Color("Point01"))
                            .font(.system(size: 20, weight: .bold))
                    }
                }
                .padding(.horizontal, 16)
            } // VStack
            
            if isClicked {
                DoneGroupMatch()
                    .onTapGesture {
                        isClicked.toggle()
                    }
            }
            
        } // ZStack
    }
}


struct DoneGroupMatch: View {
    var body: some View {
        ZStack {
            Color("GrayScale01")
                .opacity(0.5)
                .ignoresSafeArea()
            Image("ImgMainMatchCard")
                .overlay(alignment: .bottom, content: {
                    Button {
                        // action: 채팅방으로 이동시켜줌
                    } label: {
                        makeShadowEffectRoundedRectangle2(backgroundColor: "Main01", cornerRadius: 16) {
                            Text("채팅방 이동")
                                .foregroundColor(Color("GrayScale10"))
                                .bold()
                                .padding(.vertical, 4)
                        }
                    } // Button
                    .padding(24)
                })
        } // ZStack
    }
}

struct HomeMatchedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMatchedView()
        DoneGroupMatch()
    }
}
