//
//  TestView.swift
//  MC3_Project
//
//  Created by Bokyung on 2023/07/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Image("ImgMainCard1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100)
            .rotationEffect(.degrees(-8.9))
    }
}




struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
