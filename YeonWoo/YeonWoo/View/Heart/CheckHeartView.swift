//
//  CheckHeartView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/20.
//

import SwiftUI

struct CheckHeartView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Main02").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // MARK: 화면 상단의 미션 게시판 헤더
                    HStack (spacing: 0){
                        VStack (alignment: .leading, spacing: 0){
                            Text("하트")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("Point01"))
                            Text("하트로 연결된 상대틀 확인해 보세요!")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Color("GrayScale01"))
                        } // VStack - Text
                        Spacer()
                        makeShadowEffectCircle(ciecleSize: 64) {
                            Image("ImgProfile2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                        }
                        
                    } // HStack
                    .padding(.horizontal, 16)
                    .padding(.vertical, 20)
                    .background(Color("Main02-2"))
                    
                    Divider()
                        .frame(minHeight: 3)
                        .background(Color.black)
                        .foregroundColor(.black)
                    
                    // MARK: 중앙의 미션 완료 or 연결된 하트 확인 카드
                    // TODO: 미션을 완료 했는지, 연결된 하트가 없는지, 하트가 연결이 완료되었는지에 따라 imageTitle, overlay의 imageTitle을 변경시켜줘야 함
                    roundedFixedSizeImageBox(imgaeTitle: "ImgHeartCard1", boxWidth: 361, boxHeight: 500)
                        .overlay(Image("ImgHeartBubble1").offset(y: 250))
                        .padding(16)
                    Spacer()
                } // VStack
            } // ZStack
        }
    }
}

struct CheckHeartView_Previews: PreviewProvider {
    static var previews: some View {
        CheckHeartView()
    }
}
