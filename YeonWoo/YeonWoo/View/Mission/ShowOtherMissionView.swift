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
            
            TabView {
                ForEach(0..<6) { index in
                    MissionCardView(missionTitle: $missionTitle, missionDate: $missionDate, agreeNumber: $agreeNumber)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .frame(height: 400)
            .frame(maxWidth: .infinity)
        }
    }
}

struct ShowOtherMissionView_Previews: PreviewProvider {
    static var previews: some View {
        ShowOtherMissionView()
    }
}
