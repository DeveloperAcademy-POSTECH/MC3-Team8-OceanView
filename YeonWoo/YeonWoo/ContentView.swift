//
//  ContentView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct ContentView: View {
    @State var selectedPage: Int = 0
    var body: some View {
        TabView(selection: $selectedPage) {
            HomeView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("홈")
                }
                .tag(0)
            
            ChatListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("채팅방")
                }
                .tag(1)
            
            HomeView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("미션게시판")
                }
                .tag(2)
            
            HomeView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("하트")
                }
                .tag(3)
        }// tabView
        .tint(Color("Point01"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
