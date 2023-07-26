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
    @State var selectedTab: Int = 0
    
    init(mainModel: MainViewModel) {
        UITabBar.appearance().barTintColor = UIColor(Color("Main02-2"))
        self.mainModel = mainModel
        //UITabBar.appearance().backgroundColor = UIColor.red
    }
    
    // MARK: - Body
    var body: some View {
        
        TabView(selection: $selectedTab){
            MainView(mainModel: mainModel)
                .tabItem {
                    Image(selectedTab == 0 ? "IconTabmatchA" : "IconTabmatchB")
                    
                    Text("매칭")
                        .foregroundColor(selectedTab == 0 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(0)
            
            ChatListView()
                .tabItem {
                    Image(selectedTab == 1 ? "IconTabChatA" : "IconTabChatB")
                    Text("채팅")
                        .foregroundColor(selectedTab == 1 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(1)
            
            MissionCertificationView()
                .tabItem {
                    Image(selectedTab == 2 ? "IconTabMissionA" : "IconTabMissionB")
                    Text("미션")
                        .foregroundColor(selectedTab == 2 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(2)
            
            CheckHeartView()
                .tabItem {
                    // IconTabHeartA
                    Image(selectedTab == 3 ? "IconTabHeartA" : "IconTabHeartB")
                    Text("하트")
                        .foregroundColor(selectedTab == 3 ? Color("Main01") : Color("GrayScale10"))
                }
                .tag(3)
        } // TabView
        
        .accentColor(Color.Mytheme.heartColor)
        .tint(.black)
        
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(mainModel: MainViewModel())
    }
}
