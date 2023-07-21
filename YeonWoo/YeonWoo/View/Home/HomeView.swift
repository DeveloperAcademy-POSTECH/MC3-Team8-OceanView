//
//  HomeView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack (spacing: 0){
            MainHeaderView()
            
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
