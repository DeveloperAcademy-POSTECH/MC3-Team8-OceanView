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
    @State var selectedTab: Int = 0
    
//    init(mainModel: MainViewModel, vm: ChaListViewModel) {
//        UITabBar.appearance().barTintColor = UIColor(Color("Main02-2"))
//        self.mainModel = mainModel
//        self.vm = vm
//        //UITabBar.appearance().backgroundColor = UIColor.red
//    }
    
    // MARK: - Body
    var body: some View {
        
        TabView (selection: $selectedTab){
            MainView(mainModel: mainModel, vm: vm)
                .tabItem {
                    Image(selectedTab == 0 ? "IconTabmatchA" : "IconTabmatchB")
                    Text("매칭")
                        .foregroundColor(selectedTab == 0 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(0)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
            
            ChatListView(mainModel: mainModel)
                .tabItem {
                    Image(selectedTab == 1 ? "IconTabChatA" : "IconTabChatB")
                    Text("채팅")
                        .foregroundColor(selectedTab == 1 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(1)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
            
            MissionCertificationView(mainModel: mainModel, vm: vm)
                .tabItem {
                    Image(selectedTab == 2 ? "IconTabMissionA" : "IconTabMissionB")
                    Text("미션")
                        .foregroundColor(selectedTab == 2 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(2)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
            
            HeartView(mainModel: mainModel)
                .tabItem {
                    // IconTabHeartA
                    Image(selectedTab == 3 ? "IconTabHeartA" : "IconTabHeartB")
                    Text("하트")
                        .foregroundColor(selectedTab == 3 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(3)
                .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
        }
        .accentColor(Color.Mytheme.heartColor)
        .toolbarBackground(Color("OnbardingBackgroundColor"), for: .tabBar)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(mainModel: MainViewModel(), vm: ChaListViewModel())
    }
}
