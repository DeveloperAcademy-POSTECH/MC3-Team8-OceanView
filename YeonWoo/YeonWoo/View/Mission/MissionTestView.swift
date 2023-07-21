//
//  MissionTestView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/20.
//

import SwiftUI

struct MissionTestView: View {
    @State var missionTitle: String = "길에서 누워서 사진찍기" // 사람들이 수행한 미션
    @State var missionDate: String = "2023.05.05" // 미션을 수행한 날짜
    @State var agreeNumber: Int = 1234
    
    
    var body: some View {
        ZStack {
            Color.red
            
           
        } // ZStack

    }
}



struct MissionTestView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTestView()
    }
}
