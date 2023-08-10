//
//  DoneGroupMatchView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/24.
//

import SwiftUI

struct  DoneGroupMatchView: View {
    @ObservedObject var vm : ChaListViewModel
    @ObservedObject var mainModel: MainViewModel

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                roundedFixedSizeImageBox(imgaeTitle: "ImgMainMatchCard", boxWidth: 288, boxHeight: 356)
                    //.overlay(alignment: .bottom, content: {}

                NavigationLink(destination: MessageView(mainModel: mainModel, vm: vm), tag: 1, selection: $mainModel.selection) {
                    Button {
                        mainModel.selection = 1
                    } label: {
                        makeShadowEffectRoundedRectangle4(backgroundColor: "Main01", cornerRadius: 16) {
                            Text("채팅방 이동")
                                .foregroundColor(Color("GrayScale10"))
                                .bold()
                                .padding(.vertical, 4)
                        }
                    }
                } // NavigationLink
                .padding(24+2)

            } // ZStack
            .background(BackgroundClearView())
        } // NavigationView
    }
}


//struct DoneGroupMatchView2: View {
//    @ObservedObject var vm : ChaListViewModel
//    @ObservedObject var mainModel: MainViewModel
//
//    var body: some View {
//        ZStack {
//            Color("GrayScale01")
//                .opacity(0.5)
//                .ignoresSafeArea()
//
//            roundedFixedSizeImageBox(imgaeTitle: "ImgMainMatchCard", boxWidth: 288, boxHeight: 356)
//                .overlay(alignment: .bottom, content: {
//                    Button {
//                        mainModel.selection = 1
//                    } label: {
//                        makeShadowEffectRoundedRectangle4(backgroundColor: "Main01", cornerRadius: 16) {
//                            Text("채팅방 이동")
//                                .foregroundColor(Color("GrayScale10"))
//                                .bold()
//                                .padding(.vertical, 4)
//                        }
//                    } // Button
//                    .padding(24+2)
//                })
//        } // ZStack
//    }
//}


@ViewBuilder
func makeShadowEffectRoundedRectangle4<Content: View>
(backgroundColor: String, cornerRadius: CGFloat, content: () -> Content) -> some View {
    ZStack (alignment: .center){
        content()
            .padding(6)
            .frame(width: 136, height: 36)
            .background(Color("GrayScale01"))
            .cornerRadius(cornerRadius)
            .offset(x: 2, y: 2)
            .opacity(0.8)
        
        content()
            .padding(6)
            .frame(width: 136, height: 36)
            .background(Color(backgroundColor))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.black, lineWidth: 2)
            )
        .cornerRadius(cornerRadius)
    }
}

struct DoneGroupMatchView_Previews: PreviewProvider {
    static var previews: some View {
//        DoneGroupMatchView(vm: ChaListViewModel(), mainModel: MainViewModel())
        DoneGroupMatchView(vm: ChaListViewModel(), mainModel: MainViewModel())
    }
}
