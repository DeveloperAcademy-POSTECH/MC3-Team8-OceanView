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
        } // ZStack
        
        //
        // 1. 디자인 시스템이 정의가 되었지
        // 2. 폰트 뭔지 궁금
        // 3. MVVM MVC 논의
        // 4. Hi-Fi fix된거부터 순차적으로 작업할 예정!
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
