//
//  HomeNotMatchedView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/22.
//

import SwiftUI

struct HomeNotMatchedView: View {
    // MARK: - Properties
    var remainDate: Int = 196
    var remainTime: String = "2일 1시간 14분"
    @ObservedObject var mainModel: MainViewModel
    
    // MARK: - Body
    var body: some View {
        VStack (spacing: 12) {
            // MARK: 상단의 미션 정보
            MissionInfoView()
                .padding(.horizontal, 16)
                .padding(.top, 16)

            // MARK: 중앙의 남은 시간
            Text("남은 시간: \(remainTime)")
                .foregroundColor(Color("Main01"))
                .font(.system(size: 12, weight: .medium))
            
            // MARK: 하단의 카드 뷰
            roundedFixedSizeImageBox(imgaeTitle: "ImgMainCard", boxWidth: 361, boxHeight: 465)
                .overlay(
                    VStack(alignment: .leading, spacing: 4){
                        HStack (spacing: 8){
                            Text("아카데미 수료까지")
                                .font(.system(size: 20, weight: .light))
                                .foregroundColor(Color("Main01"))
                            Text("\(remainDate)일")
                                .font(.system(size: 20, weight: .light))
                                .foregroundColor(Color("GrayScale10"))
                        }
                        Text("러너들의 새로운 우연이 이루어지길 기다리고 있어요!")
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(Color("GrayScale10"))
                        Spacer()
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                )
        } // VStack
        .padding(.top, 16)
    }
}

struct HomeNotMatchedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNotMatchedView(mainModel: MainViewModel())
    }
}
