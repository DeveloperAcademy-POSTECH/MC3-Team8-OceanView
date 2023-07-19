//
//  SwiftUIView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {

        ZStack(alignment: .trailing){
            copyView()
                .offset(x : 6, y:8)
            
            Text("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세asdjfndjvdnasjvsjvasjvbjkvdbjksdbjkldvasbjkvlasbvisaljbsvaj;svbdajlksvadbjkvadbkljasdvbjlkasvblvsakbasvdjklbasdvksdvabjlkasvbdlhksbhklkvasdjbbhsalvdvsjlkvdbssvdsdadvasdsjdvnvsdkjlblsaklvsa bk ")
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                .border(.red)
                .background(Color.gray)
                .cornerRadius(13)
                .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.black, lineWidth: 4)
                    )
                //.border(Color.black, width: 2)
                .cornerRadius(8)
                .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
                .frame(width: UIScreen.main.bounds.width*0.67)
        }
    }

    
    
    private func copyView() -> some View {
        
        Text("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세asdjfndjvdnasjvsjvasjvbjkvdbjksdbjkldvasbjkvlasbvisaljbsvaj;svbdajlksvadbjkvadbkljasdvbjlkasvblvsakbasvdjklbasdvksdvabjlkasvbdlhksbhklkvasdjbbhsalvdvsjlkvdbssvdsdadvasdsjdvnvsdkjlblsaklvsa bk ")
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
            .border(.red)
            .background(Color.black)
            .border(Color.black)
            .cornerRadius(13)
            .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
            .frame(width: UIScreen.main.bounds.width*0.67)
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
