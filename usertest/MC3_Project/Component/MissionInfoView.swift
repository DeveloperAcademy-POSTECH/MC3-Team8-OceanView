//
//  MissionInfoView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/22.
//

import SwiftUI

struct MissionInfoView: View {
    var missonTitle: String = "“비오는 날 영일대에서 노래를 들으며, 키위먹고, 정장입고, 엉덩이 춤 추면서 수영하기”"
    var body: some View {
        ZStack (alignment: .topLeading){
            // TODO: 하트 색 바꿔라
            makeShadowEffectRoundedRectangle(backgroundColor: "Point01") {
                Text(missonTitle)
                    .foregroundColor(Color("GrayScale10"))
                    .font(.system(size: 20, weight: .bold))
                    .lineLimit(2)
            }
            
            makeShadowEffectRoundedRectangle3(backgroundColor: "GrayScale10", cornerRadius: 50) {
                HStack{
                    Text(Image(systemName: "heart.fill"))
                        .foregroundColor(Color("Main01"))
                    
                    Text("Mission")
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .offset(x: 20, y: -20)
        } // ZStack

    }
}

struct MissionInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MissionInfoView()
    }
}
