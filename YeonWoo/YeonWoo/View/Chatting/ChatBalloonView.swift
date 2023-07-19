//
//  ChatBalloonView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

// 해당하는 Text의 크기를 저장해줌
struct TextSizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

// 채팅을 보내는 사람이 상대방일때
struct ChatYourBalloonView: View {
    @State private var textSize: CGSize = .zero
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            HStack (spacing: 0){
                Image("Imgprofile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(width: 42)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.black, lineWidth: 2))
                    .padding(.horizontal, 19)
                Text("Puppy")
                    .font(.system(size: 15, weight: .bold))
                Spacer()
            } // HStack
            .padding(.bottom, 10)
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.white)
            // MARK: Text의 크기에 따라 Box의 크기가 바뀌는 코드 구현해야 함
            //.frame(width: textSize.width + 20, height: textSize.height + 50)
            //.frame(minWidth: 300, minHeight: 20)
                .frame(
                    width: max(textSize.width + 30, 300), // Minimum width of 100
                    height: max(textSize.height + 70, 20) // Minimum height of 100
                )
            //.shadow(color: .black, radius: 1, x: 4, y: 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 2)
                        .overlay {
                            VStack (alignment: .leading){
                                Text("가나다라마바사아자차카타파하아아아아가나다라마바사아자차카타파하아아아아가나다라마바사아자차카타파하아아아아")
                                    .frame(minWidth: 300, minHeight: 100)
                                    //.border(.red)
                                    .lineLimit(20)
                                    .background(
                                        GeometryReader { geometry in
                                            Color.clear
                                                .preference(key: TextSizeKey.self, value: geometry.size)
                                        }
                                    )
                                    .onPreferenceChange(TextSizeKey.self) { textSize in
                                        DispatchQueue.main.async {
                                            self.textSize = textSize
                                            print("width:", textSize.width)
                                            print("height:", textSize.height)
                                        }
                                    }
                                HStack {
                                    Spacer()
                                    Text("AM 08:00")
                                }
                            } // VStack
                            .padding()
                        } // overlay
                } // overlay
                .padding(.horizontal, 16)
        } // VStack
        .padding(.bottom, 40)
    }
}


// 채팅을 보내는 사람이 나일때
struct ChatMyBalloonView: View {
    @State private var textSize: CGSize = .zero
    var body: some View {
        VStack (alignment: .trailing, spacing: 0){
            HStack (spacing: 0){
                Spacer()
                Text("Puppy")
                    .font(.system(size: 15, weight: .bold))
                Image("Imgprofile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(width: 42)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.black, lineWidth: 2))
                    .padding(.horizontal, 19)
            } // HStack
            .padding(.bottom, 10)
            
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.white)
            // MARK: Text의 크기에 따라 Box의 크기가 바뀌는 코드 구현해야 함
            //.frame(width: textSize.width + 20, height: textSize.height + 50)
            //.frame(minWidth: 300, minHeight: 20)
                .frame(
                    width: max(textSize.width + 30, 300), // Minimum width of 100
                    height: max(textSize.height + 70, 20) // Minimum height of 100
                )
            //.shadow(color: .black, radius: 1, x: 4, y: 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 2)
                        .overlay {
                            VStack (alignment: .leading){
                                Text("가나다라마바사아자차카타파하아아아아가나다라마바사아자차카타파하아아아아가나다라마바사아자차카타파하아아아아")
                                    .frame(minWidth: 300, minHeight: 100)
                                    //.border(.red)
                                    .lineLimit(20)
                                    .background(
                                        GeometryReader { geometry in
                                            Color.clear
                                                .preference(key: TextSizeKey.self, value: geometry.size)
                                        }
                                    )
                                    .onPreferenceChange(TextSizeKey.self) { textSize in
                                        DispatchQueue.main.async {
                                            self.textSize = textSize
                                            print("width:", textSize.width)
                                            print("height:", textSize.height)
                                        }
                                    }
                                HStack {
                                    Spacer()
                                    Text("AM 08:00")
                                }
                            } // VStack
                            .padding()
                        } // overlay
                } // overlay
                .padding(.horizontal, 16)
        } // VStack
        .padding(.bottom, 40)
        
    }
}
struct ChatBalloonView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMyBalloonView()
    }
}