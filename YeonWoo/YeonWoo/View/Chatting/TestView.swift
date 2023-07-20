//
//  TestView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/20.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        chatBubble(textString: "안녕하십니까", textTime: "AM 08:26")
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
