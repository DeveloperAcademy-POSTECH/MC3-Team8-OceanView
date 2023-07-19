//
//  MissionCertificationView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct MissionCertificationView: View {
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
                
                ScrollView {
                    
                }
            }
        }
    }
}

struct MissionCertificationView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCertificationView()
    }
}
