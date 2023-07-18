//
//  SplashView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("ImgSplash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
            
            Button {
                
            } label: {
                Text("시작하기")
                    .foregroundColor(<#T##color: Color?##Color?#>)
            } // Button
            
        } // ZStack
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
