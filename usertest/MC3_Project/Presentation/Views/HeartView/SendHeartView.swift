//
//  SendHeartView.swift
//  MC3_Project
//
//  Created by Bokyung on 2023/07/25.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI
struct SendHeartView: View {
    
    let sideSpacing: CGFloat = 20 // Card 좌우 공백
    let totalSpacing: CGFloat = 60 // 전체 뷰에서 Card를 제외한 공백
    @ObservedObject var mainModel: MainViewModel
    
    @State var index: Int = 0 // 3개의 뷰 중,
    // Gesture를 감지하는 변수를 GestureState 키워드를 통해 바인딩을 하여 변수가 true일 때만 guesture를 실행하는 식으로 Gesture를 제공
    // CGPoint와 CGSize의 차이를 생각하면서 하세요
    @GestureState var offset: CGFloat = 0
    let titleName: [String] = ["Ocean", "Kiwi", "Puppy"]

    var body: some View {
        ZStack {
            Color.Mytheme.onbardingBackgroundColor.ignoresSafeArea()
            VStack {
                HeartHeaderView()
                
                GeometryReader { geo in
                    let adjustmentWidth = (totalSpacing / 2) - sideSpacing
                    let width = geo.size.width - (totalSpacing - sideSpacing)
                    
                    HStack (spacing: 20){
                        let users = mainModel.userInformation?.gender == "남" ?  mainModel.femaleUsers : mainModel.maleUsers
                        let _ = print("여기서 호출 \(users.count)")
                        ForEach(users) { user in
                            CardDetailView(userName: user.userName, imageName: user.profileImageUrl, titleColor: "Main01", explainColor: "Main01")
                                .frame(width: geo.size.width - totalSpacing) //, height: 509)
                                .overlay (alignment: .bottom, content: {
                                    HStack (spacing: 48){
                                        // 왼쪽 버튼
                                        Button {
                                            // action
                                            self.index = max(min(self.index-1, 2), 0)
                                        } label: {
                                            Image("IconLeftButton")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 54, height: 47)
                                        }
                                        // 중앙 버튼
                                        Button {
                                            mainModel.fetchUserInformation()
                                            mainModel.sendHeart(to: user)
                                            mainModel.setupFirestoreListenerForHartUser(hartUserUID: user.userID)
                                        } label: {
                                            Image("IconChatList")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 60)
                                        }
                                        
                                        // 오른쪽 버튼
                                        Button {
                                            // action
                                            self.index = max(min(self.index+1, 2), 0)
                                        } label: {
                                            Image("IconRightButton")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 54, height: 47)
                                        }
                                        
                                    } // HStack
                                    .padding(.bottom, 33)
                                } )// overlay
                        } // ForEach
                    } // HStack
                    .padding(.top, 43)
                    .padding(.horizontal, 20)
                    .offset(x: (CGFloat(index) * (-width) + (index != 0 ? adjustmentWidth : 0) + offset))
                    .gesture(
                        DragGesture()
                            .updating($offset, body: { value, inoutState, inoutTransaction in
                                inoutState = value.translation.width
                            })
                            .onChanged({ value in })
                            .onEnded { value in
                                // draw gesture로 변화된 width값
                                let widthOffset = value.translation.width
                                let howSwap = -widthOffset / width
                                let isNextIndex = howSwap.rounded()
                                
                                index = max(min(index+Int(isNextIndex), 2), 0)
                                
                            }) // gesture
                    //.animation(.easeInOut, value: offset == 0)
                } // GeometryReader
                .animation(.easeInOut, value: offset == 0)
            }
            
        }
    }
        
}

struct CardDetailView: View {
    let userName: String
    let imageName: String
    let titleColor: String
    let explainColor: String
    
    var body: some View {
        Image("ImgSendHeartCard")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.85)
            .shadow(radius: 5, x: 1, y: 1)
            .overlay {
                VStack (spacing: 0){
                    Text(userName)
                        .font(.system(size: 24, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 32, leading: 28, bottom: 4, trailing: 0))
                        .foregroundColor(Color(titleColor))
                   WebImage(url: URL(string: imageName))
                        .resizable()
                    //.aspectRatio(contentMode: .fit)
                        .frame(width: 280, height: 360)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        SendHeartView(mainModel: MainViewModel())
    }
}
