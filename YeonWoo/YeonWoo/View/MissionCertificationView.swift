//
//  MissionCertificationView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct MissionCertificationView: View {
    @State var missionTitle: String = "길에서 누워서 사진찍기" // 사람들이 수행한 미션
    @State var missionDate: String = "2023.05.05" // 미션을 수행한 날짜
    @State var agreeNumber: Int = 1234
    
    
    var body: some View {
        ZStack {
            Color("Main02").ignoresSafeArea()
            VStack(spacing: 0) {
                HStack (spacing: 12){
                    roundedInfinityWidthBox(boxHeight: 40, boxBackgroundColor: "Point01") {
                        Text("미션 인증 게시판")
                            .foregroundColor(Color("GrayScale10"))
                            .font(Font.custom("Pretendard-Bold", size: 20))
                    }
                    roundedFixedSizeBox(boxWidth: 40, boxHeight: 40, boxBackgroundColor: "Main01") {
                        Text(Image(systemName: "plus"))
                            .foregroundColor(Color("GrayScale10"))
                    }
                } // HStack
                .padding(.horizontal, 17)
                .padding(.vertical, 20)
                
                // 위아래 스크롤
                ScrollView {
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
                    OthersMissionView(missionTitle: $missionTitle, missionDate: $missionDate, agreeNumber: $agreeNumber)
                    
                    
                } // 위아래 ScrollView
            }
        }
    }
}

struct MissionCertificationView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCertificationView()
    }
}
