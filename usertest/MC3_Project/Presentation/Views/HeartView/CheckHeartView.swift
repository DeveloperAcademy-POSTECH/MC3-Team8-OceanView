//
//  CheckHeartView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/20.
//

import SwiftUI

struct CheckHeartView: View {
    var number: Int = 0
    @ObservedObject var mainModel: MainViewModel
    var body: some View {
        NavigationView {
            ZStack (alignment: .center){
                Color("Main02").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // MARK: 화면 상단의 미션 게시판 헤더
                    HeartHeaderView(mainModel: mainModel)
                    
                    // MARK: 중앙의 미션 완료 or 연결된 하트 확인 카드
                    // TODO: 미션을 완료 했는지, 연결된 하트가 없는지, 하트가 연결이 완료되었는지에 따라 imageTitle, overlay의 imageTitle을 변경시켜줘야 함
                    
                    // if로 그냥 뷰 본거임. 로직에 따라 뷰 골라서 쓰면 됩니다!
                    if (number == 0){
                        // MARK: Heart1-1-1, Heart1-1-2
                        roundedFixedSizeImageBox(imgaeTitle: "ImgHeartCard1", boxWidth: 361, boxHeight: 500)
                            .overlay(Image("ImgHeartBubble1").offset(y: 250))
                            .padding(16)
                    }
                     else if (number == 1){
                        // MARK: Heart1-1-3
                        Spacer()
                        LoadingAnimationView()
                            .padding(.bottom, 50)
                            .overlay(
                                ZStack {
                                    roundedFixedSizeImageBox(imgaeTitle: mainModel.girlImg, boxWidth: 120, boxHeight: 190)
                                        .rotationEffect(.degrees(-8.9))
                                        .offset(x: -100, y: -175)
                                    
                                    roundedFixedSizeImageBox(imgaeTitle: mainModel.boylImg, boxWidth: 160, boxHeight: 260)
                                        .rotationEffect(.degrees(20))
                                        .offset(x: 65, y: 145)
                                }
                            ) // overlay
                    } // number == 1
                    else if (number == 2) {
                        // MARK: Heart1-1-4
                        HeartListView()
                    }
                    else if (number == 3) {
                        // MARK: Heart1-2-1, Heart1-2-2, Heart1-2-3
                        SendHeartView(mainModel: mainModel)
                    }
                    Spacer()
                } // VStack
            } // ZStack
        }
    }
}

struct CheckHeartView_Previews: PreviewProvider {
    static var previews: some View {
        CheckHeartView(mainModel: MainViewModel())
    }
}
