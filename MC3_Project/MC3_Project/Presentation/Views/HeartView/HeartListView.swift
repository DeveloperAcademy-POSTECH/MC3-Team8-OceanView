//
//  HeartListView.swift
//  MC3_Project
//
//  Created by Bokyung on 2023/07/25.
//

import SwiftUI

struct HeartListView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 8, alignment: .center),
        GridItem(.flexible(), spacing: 8, alignment: .center),
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                ForEach(1..<6) { index in
                    roundedFixedSizeImageBox(imgaeTitle: "ImgMainCard1", boxWidth: 172, boxHeight: 241)
                        .overlay(alignment: .bottom) {
                            HStack(spacing: 13) {
                                makeShadowEffectCircleProfile2(ciecleSize: 42) {
                                    Image("ImgProfile2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                Text("Luna")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(Color("GrayScale10"))
                                Spacer()
                            }
                            .padding(12)
                        }
                }
            } // LazyVGrid
            .padding(.horizontal, 15)
            .frame(height: UIScreen.main.bounds.height)
            .border(.red)
        }
    }
}

struct HeartListView_Previews: PreviewProvider {
    static var previews: some View {
        HeartListView()
    }
}
