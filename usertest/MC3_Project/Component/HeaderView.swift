//
//  HeaderView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/21.
//

import SwiftUI
import Firebase
import SDWebImage
import SDWebImageSwiftUI


struct MainHeaderView: View {
    // MARK: - Properties
    @ObservedObject var mainModel: MainViewModel
    
    // MARK: - Body
    var body: some View {
        // MARK: 화면 상단의 헤더
        
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 0){
                    HStack (spacing: 0){
                        if let userName = mainModel.userInformation?.userName {
                            Text("'\(userName)'")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("Point01"))
                        }
                            Text("님")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("GrayScale01"))
                    }
                    
                    Text("오늘의 우연을 만나보세요.")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                
                if let profileImage = mainModel.profileImage {
                    makeShadowEffectCircleProfile(ciecleSize: 64) {
                        profileImage
                            .resizable()
                            .frame(width: 64, height: 64)
                    }
                    .padding(10) // 이미지 자체에도 padding 10이 있음
                }
            } // HStack
            //.frame(height: 75)
            .padding(.horizontal, 16)
            .background(Color("Main02-2"))
            
            Divider()
                .frame(minHeight: 2)
                .background(Color.black)
        } // VStack
    }
}


struct ChatHeaderView: View {
    // MARK: - Properties
    @ObservedObject var mainModel: MainViewModel
    
    var body: some View {
        // MARK: 화면 상단의 채팅방 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 8){
                    Text("채팅방")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("Point01"))
                    Text("사람들과 자유롭게 미션을 진행하세요.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                
                if let profileImage = mainModel.profileImage {
                    makeShadowEffectCircleProfile(ciecleSize: 64) {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    } .padding(10) // 이미지 자체에도 padding 10이 있음
                }
                
            } // HStack
            //.frame(height: 75)
            .padding(.horizontal, 16)
            .background(Color("Main02-2"))
            Divider()
                .frame(minHeight: 2)
                .background(Color.black)
                .foregroundColor(.black)
        }
    }
}


struct MissionHeaderView: View {
    @ObservedObject var mainModel: MainViewModel
    
    var body: some View {
        // MARK: 화면 상단의 채팅방 헤더
        // MARK: 화면 상단의 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 8){
                    Text("미션 게시판")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("Point01"))
                    Text("수행했던 미션을 인증하고 공유해보세요.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                if let profileImage = mainModel.profileImage {
                    makeShadowEffectCircleProfile(ciecleSize: 64) {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    } .padding(10) // 이미지 자체에도 padding 10이 있음
                }
                
            } // HStack
            //.frame(height: 75)
            .padding(.horizontal, 16)
            .background(Color("Main02-2"))
            Divider()
                .frame(minHeight: 2)
                .background(Color.black)
                .foregroundColor(.black)
        }
    }
}



struct HeartHeaderView: View {
    @ObservedObject var mainModel: MainViewModel
    
    var body: some View {
        // MARK: 화면 상단의 미션 헤더
        VStack (spacing: 0){
            HStack (spacing: 0){
                VStack (alignment: .leading, spacing: 8){
                    Text("하트")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("Point01"))
                    Text("하트로 연결된 상대틀 확인해 보세요!")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                
                if let profileImage = mainModel.profileImage {
                    makeShadowEffectCircleProfile(ciecleSize: 64) {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    } .padding(10) // 이미지 자체에도 padding 10이 있음
                }
                
            } // HStack
            //.frame(height: 75)
            .padding(.horizontal, 16)
            .background(Color("Main02-2"))
            Divider()
                .frame(minHeight: 2)
                .background(Color.black)
                .foregroundColor(.black)
        }
    }
}



// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainHeaderView(mainModel: MainViewModel())
        ChatHeaderView(mainModel: MainViewModel())
        MissionHeaderView(mainModel: MainViewModel())
        HeartHeaderView(mainModel: MainViewModel())
    }
}
