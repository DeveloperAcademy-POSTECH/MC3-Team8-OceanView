//
//  MissionCertificationView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct MissionCertificationView: View {
    var body: some View {
        
        // 좌우 간격이 안맞고, divider가 좀 더 오른쪽으로 와야 한다
        NavigationView {
            ZStack {
                Color("Main02").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // MARK: 화면 상단의 미션 게시판 헤더
                    MissionHeaderView()
                    
                    // MARK: 중앙~하단의 미션 인증 사진 리스트들
                    ScrollView {
                        ForEach(0..<10) { index in
                            MissionCardView()
                                .padding(.vertical, 16)
                        }
                    } // 위아래 ScrollView
                } // VStack
                
                // MARK: 화면 하단 우측의 +버튼
                NavigationLink {
                    UploadPhotoView()
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
        MissionCertificationView()
    }
}
