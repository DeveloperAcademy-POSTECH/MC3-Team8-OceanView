//
//  LoginView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @ObservedObject var mainModel: MainViewModel
    
    var body: some View {
        ZStack {
            Color.Mytheme.onbardingBackgroundColor.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                // MARK: - 화면 상단의 헤더
                MainHeaderView(mainModel: mainModel)
                
                if mainModel.userInformation?.waitingMatching == false {
                    HomeMatchedView(mainModel: mainModel)
                } else {
                    HomeNotMatchedView(mainModel: mainModel)
                }
                
                Spacer()
            }
        }
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    
    @ObservedObject var mainModel = MainViewModel()

    static var previews: some View {
        MainView(mainModel: MainViewModel())
    }
}
