//
//  MissionTestView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/20.
//

import SwiftUI

struct MissionTestView: View {
    @State var missionTitle: String = "길에서 누워서 사진찍기" // 사람들이 수행한 미션
    @State var missionDate: String = "2023.05.05" // 미션을 수행한 날짜
    @State var agreeNumber: Int = 1234
    
    
    var body: some View {
        ZStack {
            Color.red
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("GrayScale10"))
                .frame(width: 310, height: 78)
                .overlay(content: {
                    HStack (spacing: 0) {
                        VStack (alignment: .leading, spacing: 4) {
                            Text(missionTitle)
                                .font(.system(size: 16, weight: .bold))
                            Text(missionDate)
                                .font(.system(size: 12))
                        } // VStack
                        Spacer()
                        Divider()
                            .frame(minWidth: 3)
                            .background(Color.black)
                            .frame(height: 30)
                            
                        Spacer()
                        Button {
                            // 하트를 보낼 수 있는 버튼
                        } label: {
                            HStack(spacing: 4){
                                Text("\(agreeNumber)")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("GrayScale01"))
                                Text(Image(systemName: "heart"))
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("GrayScale01"))
                            }
                            .padding(10)
                        }
                    } // HStack
                    .padding(.horizontal, 16)
                })
                .padding(.bottom, 16)
        } // ZStack

    }
}

struct MissionTestView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTestView()
    }
}
