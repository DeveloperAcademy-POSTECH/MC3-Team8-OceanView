//
//  OthersMissionView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct OthersMissionView: View {
    @Binding var missionTitle: String
    @Binding var missionDate: String
    @Binding var agreeNumber: Int
    
    var body: some View {
        roundedFixedSizeImageBox(boxWidth: 342, boxHeight: 342, boxBackgroundImage: "ImgMissionCerti") {
            VStack (spacing: 0){
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("GrayScale10")
                        .opacity(0.7))
                    .frame(width: 310, height: 78)
                    .overlay(content: {
                        HStack (spacing: 0){
                            VStack (alignment: .leading, spacing: 0) {
                                Text(missionTitle)
                                    .font(.system(size: 16, weight: .bold))
                                Text(missionDate)
                                    .font(.system(size: 12))
                            } // VStack
                            Spacer()
                            Button {
                                // 하트를 보낼 수 있는 버튼
                            } label: {
                                HStack(spacing: 0){
                                    Text(Image(systemName: "heart.fill"))
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("Main01"))
                                    Text("\(agreeNumber)")
                                        .font(.system(size: 14)).foregroundColor(Color("GrayScale01"))
                                }
                                .padding(10)
                                .background(Color("GrayScale10"))
                                .cornerRadius(20)
                            }
                            
                            
                        } // HStack
                        .padding(.horizontal, 16)
                    })
                    .padding(.bottom, 16)
            }
        }
    }
}

struct OthersMissionView_Previews: PreviewProvider {
    static var previews: some View {
        OthersMissionView(missionTitle: .constant("길에서 누워서 사진찍기"), missionDate: .constant("2023.05.05"), agreeNumber: .constant(1234))
    }
}
