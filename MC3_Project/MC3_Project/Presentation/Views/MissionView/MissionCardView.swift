//
//  MissionCardView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct MissionCardView: View {
    // 좌우 간격이 안맞고, divider가 좀 더 오른쪽으로 와야 한다
    @State var missionTitle: String = "길에서 누워서 사진찍기" // 사람들이 수행한 미션
    @State var missionDate: String = "2023.05.05" // 미션을 수행한 날짜
    @State var agreeNumber: Int = 1234
    
    var body: some View {
        ZStack {
            Image("ImgMissionCardBack1")
            
            roundedFixedSizeImageBox(imgaeTitle: "ImgMissionCerti", boxWidth: 342, boxHeight: 342)
            
            makeShadowEffectRoundedRectangle (backgroundColor: "GrayScale10") {
                HStack (spacing: 0) {
                    VStack (alignment: .leading, spacing: 4) {
                        Text(missionTitle)
                            .font(.system(size: 16, weight: .bold))
                            .lineLimit(1)
                        Text(missionDate)
                            .font(.system(size: 12))
                            .foregroundColor(Color("GrayScale04"))
                    } // VStack
                    Spacer()
                    Divider()
                        .frame(minWidth: 2)
                        .background(Color.black)
                        .frame(height: 30)
                    
                    Spacer()
                    Button {
                        // 하트를 보낼 수 있는 버튼
                    } label: {
                        HStack(spacing: 4){
                            Text("\(agreeNumber)")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color("GrayScale01"))
                            Text(Image(systemName: "heart"))
                                .font(.system(size: 14))
                                .foregroundColor(Color("GrayScale03"))
                        }
                    } // Button
                } // HStack
            }
            .frame(width: 310)
            .offset(x: 0, y: 185)
        } // ZStack
    }
}

@ViewBuilder
func makeShadowEffectRoundedRectangle3<Content: View>
(backgroundColor: String, content: () -> Content) -> some View {
    ZStack (alignment: .trailing){
        content()
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(Color("GrayScale01"))
            .cornerRadius(16)
            //.shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .offset(x: 2, y: 2)
            .opacity(0.9)
        
        content()
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
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
struct MissionCardView_Previews: PreviewProvider {
    static var previews: some View {
        //        MissionCardView(missionTitle: .constant("길에서 누워서 사진찍기"), missionDate: .constant("2023.05.05"), agreeNumber: .constant(1234))
        
        MissionCardView()
    }
}
