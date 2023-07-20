//
//  UploadPhotoView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct UploadPhotoView: View {
    var body: some View {
        ZStack {
            Color("Main02").ignoresSafeArea()
            VStack (spacing: 9){
                roundedInfinityWidthBox(boxHeight: 40, boxBackgroundColor: "Point01") {
                    Text("인증 사진 업로드")
                        .foregroundColor(Color("GrayScale10"))
                        .font(Font.custom("Pretendard-Bold", size: 20))
                }
                roundedInfinityWidthBox(boxHeight: 85, boxBackgroundColor: "GrayScale10") {
                    Text("영일대에서 정장입고 수영하기")
                        .foregroundColor(Color("GrayScale01"))
                        .font(Font.custom("Pretendard-Bold", size: 20))
                }
                
                roundedInfinityWidthBox(boxHeight: 197, boxBackgroundColor: "GrayScale10") {
                    Button {
                        // action
                    } label: {
                        Text(Image(systemName: "photo.artframe"))
                            .font(.system(size: 48))
                            .foregroundColor(Color("GrayScale01"))
                    }
                }
                
                Button {
                    // action
                } label: {
                    Text("업로드")
                        .foregroundColor(Color("GrayScale01"))
                }
                .padding(15)
                .background(Color("GrayScale10"))
                .border(.black)

                Spacer()
            } // VStack
            .padding(.horizontal, 20)
        } // ZStack
    }
    
    func uploadPhoto() {
        
    }
}

struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView()
    }
}
