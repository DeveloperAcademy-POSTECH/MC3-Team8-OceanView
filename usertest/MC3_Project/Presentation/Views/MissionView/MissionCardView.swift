//
//  MissionCardView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct MissionCardView: View {
    @ObservedObject var mainModel: MainViewModel
    @State var missionTitle: String = "길에서 누워서 사진찍기" // 사람들이 수행한 미션
    @State var missionDate: String = "2023.05.05" // 미션을 수행한 날짜
    @State var agreeNumber: Int = 1234
    
    var body: some View {
        ZStack {
            Image("ImgMissionCardBack1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 360)
            
            roundedFixedSizeImageBox(imgaeTitle: "ImgMissionCerti", boxWidth: 332, boxHeight: 332)
            
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
            .offset(x: 0, y: 175)
        } // ZStack
    }
}


struct MissionCardView_Previews: PreviewProvider {
    static var previews: some View {
        //        MissionCardView(missionTitle: .constant("길에서 누워서 사진찍기"), missionDate: .constant("2023.05.05"), agreeNumber: .constant(1234))
        
        MissionCardView(mainModel: MainViewModel())
    }
}
