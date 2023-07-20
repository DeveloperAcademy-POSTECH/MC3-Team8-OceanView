//
//  TestView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/20.
//

import SwiftUI

//chatList(imageTitle: "IconChatList", missionTitle: "영일대에서 키위먹고 수영하기", lastChat: "안녕하세요. 저는 골드키위입니다 반기워요!", timeInfo: "AM 8:26")
struct TestView: View {
    var body: some View {
        makeShadowEffectCircle(ciecleSize: 100) {
            Image("Imgprofile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
        }
    }
}




struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

//
//ZStack (alignment: .trailing){
//    VStack (alignment: .leading){
//        Text(textString)
//            .foregroundColor(Color("GrayScale01"))
//            .font(.system(size: 14))
//            .lineLimit(20)
//        HStack (spacing: 0){
//            Spacer()
//            Text(textTime)
//                .foregroundColor(Color("GrayScale07"))
//                .font(.system(size: 10))
//        }
//    }
//    .padding(16)
//    .background(Color.black)
//    .cornerRadius(4)
//    .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
//    .frame(width: UIScreen.main.bounds.width*0.67)
//    .offset(x: 3, y: 3)
//
//    VStack (alignment: .leading){
//        Text(textString)
//            .foregroundColor(Color("GrayScale01"))
//            .font(.system(size: 14))
//            .lineLimit(20)
//        HStack (spacing: 0){
//            Spacer()
//            Text(textTime)
//                .foregroundColor(Color("GrayScale07"))
//                .font(.system(size: 10))
//        }
//    }
//    .padding(16)
//    .background(Color("GrayScale10"))
//    .cornerRadius(4)
//    .overlay(
//        RoundedRectangle(cornerRadius: 13)
//            .stroke(Color.black, lineWidth: 4)
//    )
//    .cornerRadius(8)
//    .shadow(color: Color(.sRGBLinear, white: 1, opacity: 0), radius: 0)
//    .frame(width: UIScreen.main.bounds.width*0.67)
//
//}