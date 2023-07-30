//
//  HeartView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/27.
//

import SwiftUI

struct HeartView: View {
    @ObservedObject var mainModel: MainViewModel
    var body: some View {
        
        ZStack {
            Color.Mytheme.onbardingBackgroundColor.ignoresSafeArea()
            VStack {
                if mainModel.isMission == false {
                    
                    HeartHeaderView(mainModel: mainModel)
                    
                    roundedFixedSizeImageBox(imgaeTitle: "ImgHeartCard1", boxWidth: 361, boxHeight: 500)
                        .overlay(Image("ImgHeartBubble1").offset(y: 250))
                        .padding(16)
                    
                    Spacer()
                } else {
                    if mainModel.isMatchedWithUser == false {
                        SendHeartView(mainModel: mainModel)
                        Spacer()
                    } else {
                        if mainModel.heartMatchingView == false {
                            roundedFixedSizeImageBox(imgaeTitle: "ImgHeartCard2", boxWidth: 361, boxHeight: 500)
                                .overlay(Image("ImgHeartBubble3").offset(y: 250))
                                .padding(16)
                                .onTapGesture {
                                    mainModel.heartMatchingView.toggle()
                                }
                            
                        } else {
                            Spacer()
                            LoadingAnimationView()
                                .padding(.bottom, 50)
                                .overlay(
                                    ZStack {
                                        roundedFixedSizeImageBox(imgaeTitle: "ImgMainCard1", boxWidth: 120, boxHeight: 190)
                                            .rotationEffect(.degrees(-8.9))
                                            .offset(x: -100, y: -175)
                                        
                                        roundedFixedSizeImageBox(imgaeTitle: "ImgMainCard1", boxWidth: 160, boxHeight: 260)
                                            .rotationEffect(.degrees(20))
                                            .offset(x: 65, y: 145)
                                    }
                                ) // overlay
                        }

                        Spacer()
                    }
                }
            }
        }
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView(mainModel: MainViewModel())
    }
}
