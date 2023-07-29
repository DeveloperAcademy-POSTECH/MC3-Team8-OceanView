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
            ZStack(alignment: .center) {
                    Image("ImgMainMatchCard")
                
                NavigationLink(destination: MessageView(mainModel: mainModel, vm: vm), tag: 1, selection: $mainModel.selection) {
                    Button {
                        mainModel.selection = 1
                    } label: {
                       makeShadowEffectRoundedRectangle2(backgroundColor: "Main01", cornerRadius: 16) {
                            Text("채팅방 이동")
                                .foregroundColor(Color("GrayScale10"))
                                .bold()
                                .padding(.vertical, 4)
                                
                        }
                    }

                }
            
            }
            .background(BackgroundClearView())
        }
    }
}


struct DoneGroupMatchView_Previews: PreviewProvider {
    static var previews: some View {
        DoneGroupMatchView(vm: ChaListViewModel(), mainModel: MainViewModel())
    }
}
