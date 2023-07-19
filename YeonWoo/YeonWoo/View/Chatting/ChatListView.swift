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
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1, x: 4, y: 4)
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .overlay {
                    NavigationLink {
                        // destination
                    } label: {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.black, lineWidth: 1)
                            .overlay {
                                HStack (alignment: .top, spacing: 0) {
                                    Image("Imgprofile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 42)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(.black, lineWidth: 2))
                                        .padding(.horizontal, 19)
                                    VStack (alignment: .leading,spacing: 0){
                                        Text("영일대에서 키위먹고 수영하기")
                                            .font(
                                                Font.custom("Pretendard-Bold", size: 15)
                                            )
                                            .padding(.bottom, 5)
                                        
                                        Text("안녕하세요 저는 골드키위입니다")
                                            .foregroundColor(Color("GrayScale06"))
                                            .font(
                                                Font.custom("Pretendard-Medium", size: 12)
                                            )
                                    }
                                    .padding(.leading, 3)
                                    Text("AM 08:26")
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
            
        } // NavigationView
        .tint(.black)
        
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
