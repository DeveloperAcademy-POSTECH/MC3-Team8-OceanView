//
//  SwiftUIView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Properties
    @ObservedObject var mainModel: MainViewModel
    @ObservedObject var vm : ChaListViewModel
    // MARK: - Body
    var body: some View {
    
        TabView {
            MainView(mainModel: mainModel, vm: vm)
                .tabItem {
                    Image(systemName: "heart")
                    Text("홈")
                }
                .tag(1)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
            
            ChatListView(mainModel: mainModel)
                .tabItem {
                    Image(systemName: "heart")
                    Text("채팅방")
                }
                .tag(2)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
            
            MissionCertificationView(mainModel: mainModel, vm: vm)
                .tabItem {
                    Image(systemName: "heart")
                    Text("미션게시판")
                }
                .tag(3)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
            
            HeartView(mainModel: mainModel)
                .tabItem {
                    Image(systemName: "heart")
                    Text("하트")
                }
                .tag(4)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
        }.accentColor(Color.Mytheme.heartColor)
            .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(mainModel: MainViewModel(), vm: ChaListViewModel())
    }
}
