//
//  ShowOtherMissionView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct ShowOtherMissionView: View {
    @State var missionTitle: String = "길에서 누워서 사진찍기" // 사람들이 수행한 미션
    @State var missionDate: String = "2023.05.05" // 미션을 수행한 날짜
    @State var agreeNumber: Int = 1234
    
    // TabView의 indicator 색상 변경
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .init(Color("Main01"))
        UIPageControl.appearance().pageIndicatorTintColor = .init(Color("GrayScale08"))
    }
    
    var body: some View {
        VStack (spacing: 0){
            HStack (spacing: 0){
                Text("다른 사람들의 미션 인증")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                Button {
                    // action
                } label: {
                    Text("더보기")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("GrayScale01"))
                }
            } // HStack
            .padding(.horizontal, 26)
            
            
            MissionCardView()
        }
    }
}


//@ViewBuilder
//func roundedFixedSizeImageBox<Content: View>
//(boxWidth: CGFloat, boxHeight: CGFloat, boxBackgroundImage: String, @ViewBuilder content: () -> Content) -> some View {
//    Rectangle()
//        .foregroundColor(.clear)
//        .frame(width: boxWidth, height: boxHeight)
//        .background(Color("GrayScale01"))
//        .cornerRadius(20)
//        .overlay(
//            Image(boxBackgroundImage)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(maxWidth: .infinity)
//                .overlay {
//                    content()
//                }
//        )
//}


//RoundedRectangle(cornerRadius: 20)
//    .foregroundColor(Color("GrayScale10"))
//    .frame(width: 310, height: 78)
//    .overlay(content: {
//        HStack (spacing: 0) {
//            VStack (alignment: .leading, spacing: 4) {
//                Text(missionTitle)
//                    .font(.system(size: 16, weight: .bold))
//                Text(missionDate)
//                    .font(.system(size: 12))
//            } // VStack
//            Spacer()
//            Divider()
//                .frame(minWidth: 3)
//                .background(Color.black)
//                .frame(height: 30)
//
//            Spacer()
//            Button {
//                // 하트를 보낼 수 있는 버튼
//            } label: {
//                HStack(spacing: 4){
//                    Text("\(agreeNumber)")
//                        .font(.system(size: 14))
//                        .foregroundColor(Color("GrayScale01"))
//                    Text(Image(systemName: "heart"))
//                        .font(.system(size: 14))
//                        .foregroundColor(Color("GrayScale01"))
//                }
//                .padding(10)
//            }
//        } // HStack
//        .padding(.horizontal, 16)
//    })
//    .padding(.bottom, 16)
//    .offset(x: 0, y: 160)


struct ShowOtherMissionView_Previews: PreviewProvider {
    static var previews: some View {
        ShowOtherMissionView()
    }
}
