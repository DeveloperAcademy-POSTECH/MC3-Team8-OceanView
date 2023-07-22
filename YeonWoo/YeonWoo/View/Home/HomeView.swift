//
//  HomeView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct HomeView: View {
    var isGroupMatched: Bool = true
    var body: some View {
        VStack (spacing: 0){
            // MARK: 화면 상단의 헤더
            MainHeaderView()
                .padding(.bottom, 16)
            
            // MARK: 화면 중앙
            // Case1) 그룹 매치되었을때
            // Case2) 그룹 매치되지 않았을때
            if isGroupMatched { // 그룹이 매치되었을떄
                HomeNotMatchedView()
            }
            else{ // 그룹이 매치되지 않았을때
                HomeMatchedView()
            }
            Spacer()
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
