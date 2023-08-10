//
//  MissionCertificationView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct MissionCertificationView: View {
    
    @ObservedObject var mainModel: MainViewModel
    @ObservedObject var vm : ChaListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Main02").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // MARK: 화면 상단의 미션 게시판 헤더
                    MissionHeaderView(mainModel: MainViewModel())
                    
                    // MARK: 중앙~하단의 미션 인증 사진 리스트들
                    ScrollView {
                        ForEach(0..<10) { index in
                            MissionCardView(mainModel: MainViewModel())
                                .padding(.vertical, 16)
                        }
                    } // 위아래 ScrollView
                } // VStack
                
                // MARK: 화면 하단 우측의 +버튼
                NavigationLink {
                    UploadPhotoView(mainModel: mainModel, vm: vm)
                } label: {
                    makeShadowEffectCircle(ciecleSize: 56) {
                        Image("IconPlusButton")
                    }
                }
                .position(x: UIScreen.main.bounds.width * 0.9, y: UIScreen.main.bounds.height * 0.78)
                
            } // ZStack
        } // NavigationView
        
        
    }
}

struct MissionCertificationView_Previews: PreviewProvider {
    static var previews: some View {
        MissionCertificationView(mainModel: MainViewModel(), vm: ChaListViewModel())
    }
}
