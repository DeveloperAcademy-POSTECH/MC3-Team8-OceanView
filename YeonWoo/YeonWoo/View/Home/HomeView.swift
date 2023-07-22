//
//  HomeView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct HomeView: View {
    var isGroupMatched: Bool = false
    var body: some View {
        VStack (spacing: 0){
            // MARK: 화면 상단의 헤더
            MainHeaderView()
            
            // MARK: 화면 중앙
            // Case1) 그룹 매치되었을때
            // Case2) 그룹 매치되지 않았을때
            if isGroupMatched { // 그룹이 매치되었을떄
                
            }
            else{ // 그룹이 매치되지 않았을때
                
            }
            MissionInfoView()
                .padding(.top, 32)
                .padding(.horizontal, 16)
            
            Spacer()
            Text("남은 시간: 2일 1시간 14분")
            Spacer()
            
        }
        
    }
}

struct CardView: View {
    var body: some View {
        Rectangle()
            .cornerRadius(20)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color("Main02"))
            .overlay {
                Text("1일 12시간 남았습니다.. ")
                
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
