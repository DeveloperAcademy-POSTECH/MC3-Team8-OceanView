//
//  HomeMatchedView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/22.
//

import SwiftUI

struct HomeMatchedView: View {
    // MARK: - Properties
    var remainDate: Int = 196
    @ObservedObject var vm : ChaListViewModel
    @ObservedObject var mainModel: MainViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack (spacing: 16){
                // 화면 중앙의 카드 뷰
                roundedFixedSizeImageBox(imgaeTitle: "ImgMainCard", boxWidth: 361, boxHeight: 524)
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
                
                // 화면 하단의 버튼 뷰
                makeShadowEffectRoundedRectangle(backgroundColor: "Main02-2") {
                    Button {
                        mainModel.updateIsParticipated()
                    } label: {
                        Text(mainModel.userInformation?.isParticipated ?? false ? "매칭 진행 중..." : "새로운 우연 만나기")
                            .foregroundColor(Color("Point01"))
                            .font(.system(size: 20, weight: .bold))
                            .padding(3.5)
                    }
                }
                .padding(.horizontal, 16)
            } // VStack
            .padding(.top, 16)
            .onAppear {
                mainModel.setupFirestoreListener()
            }
        }
            .fullScreenCover(isPresented: $mainModel.goToChatRoom) {
                DoneGroupMatchView(vm: vm, mainModel: mainModel)
                    .background(BackgroundClearView())
            }// ZStack
    }
}



struct HomeMatchedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMatchedView(vm: ChaListViewModel(), mainModel: MainViewModel())
    }
}
