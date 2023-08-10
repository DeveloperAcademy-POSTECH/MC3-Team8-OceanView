//
//  MessageView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/25.
//

import SwiftUI

struct MessageView: View {
    
    @StateObject var messagesManager = MessageManager()
    @ObservedObject var mainModel: MainViewModel
    @ObservedObject var vm : ChaListViewModel
    
    var body: some View {
            ZStack {
                Color("Main02").ignoresSafeArea()
                VStack {
                    VStack(spacing: 0) {
                        roundedInfinityWidthBox(boxHeight: 40, boxBackgroundColor: "Point01") {
                            RoundedRectangle(cornerRadius: 4)
                                .inset(by: 1)
                                .stroke(.black, lineWidth: 2)
                                .overlay {
                                    Text("영일대에서 키위와 골든키위 먹기")
                                        .foregroundColor(Color("GrayScale10"))
                                        .font(Font.custom("Pretendard-Bold", size: 20))
                                }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 28)
                        
                        Text("미션이 시작되었습니다.")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color("Main01"))
                        Text("새로운 우연과 미션을 수행해주세요")
                            .font(Font.custom("Pretendard-Bold", size: 13))
                            .foregroundColor(Color("Main01"))
                     
                        ScrollViewReader { proxy in
                            ScrollView{
                                ForEach(messagesManager.messages, id: \.id) { message in
                                    MessageBubble(message: message, mainModel: mainModel)
                                }
                            }
                            .onChange(of: messagesManager.lastMessageId) { id in
                                withAnimation {
                                    proxy.scrollTo(id, anchor: .bottom)
                                }
                            }
                        }
                        Spacer()
                        MessageField(mainModel: mainModel)
                            .environmentObject(messagesManager)
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("채팅방")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: NavigationLink(destination: {
                MainTabView(mainModel: mainModel, vm: vm).navigationBarBackButtonHidden()
                    .onAppear {
                            mainModel.goToChatRoomCount = 1
                            mainModel.goToChatRoom = false
                            mainModel.selection = 2
                    }
            }, label: {
                Image(systemName: "chevron.backward")
        }))
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView( mainModel: MainViewModel(), vm: ChaListViewModel())
    }
}
