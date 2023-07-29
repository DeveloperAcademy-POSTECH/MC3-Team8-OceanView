import SwiftUI

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
                            Text("\(userName)")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("Point01"))
                        }
                            Text("님")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color("GrayScale01"))
                    }
                    
                    Text("오늘의 우연을 만나보세요.")
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(Color("GrayScale01"))
                } // VStack - Text
                Spacer()
                
                if let profileImage = mainModel.profileImage {
                    makeShadowEffectCircle(ciecleSize: 64) {
                        profileImage
                            .resizable()
                            .frame(width: 64, height: 64)
                    }
                }
                
            } // HStack
            .frame(height: 75)
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
            .background(Color("Main02-2"))
            
            Divider()
                .frame(minHeight: 3)
                .background(Color.black)
                .foregroundColor(.black)
        }
    }
}
