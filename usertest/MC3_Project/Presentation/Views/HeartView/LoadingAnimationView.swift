//
//  LoadingAnimationView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/21.
//

import SwiftUI

struct LoadingAnimationView: View {
    @State var showLoadingIndicator = [false, false, false]
    var body: some View {
        ZStack{
            if showLoadingIndicator[0]{
                GrowingCircleIndicatorView()
                    .foregroundColor(Color("Point02"))
                    .opacity(0.4)
            }
            if showLoadingIndicator[1]{
                GrowingCircleIndicatorView()
                    .foregroundColor(Color("Point01"))
                    .opacity(0.25)
            }
            if showLoadingIndicator[2]{
                GrowingCircleIndicatorView()
                    .foregroundColor(Color("Point01"))
                    .opacity(0.6)
            }
            Image("IconHeartCenter")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 71)
        }
        .onAppear {
            for i in 0...2 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4 * Double(i)){
                    showLoadingIndicator[i].toggle()
                }
            }
        }
    }
}

struct GrowingCircleIndicatorView: View {
    
    @State private var scale: CGFloat = 0
    @State private var opacity: Double = 0
    
    var body: some View {
        let animation = Animation
            .easeIn(duration: 1.6)
            .repeatForever(autoreverses: false)
        
        return Circle()
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                scale = 0.35
                opacity = 0.5
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    withAnimation(animation) {
                        scale = 1.5
                        opacity = 0
                    }
                }
            }
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}
