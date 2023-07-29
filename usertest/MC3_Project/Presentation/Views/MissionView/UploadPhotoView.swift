//
//  UploadPhotoView.swift
//  YeonWoo
//
//  Created by Bokyung on 2023/07/19.
//

import SwiftUI

struct UploadPhotoView: View {
    
    @ObservedObject var mainModel: MainViewModel
    @ObservedObject var vm : ChaListViewModel
    
    var body: some View {
        ZStack {
            Color("Main02").ignoresSafeArea()
            VStack (spacing: 0){
                // MARK: 상단의 미션 사진 업로드 헤더
                makeShadowEffectRoundedRectangle(backgroundColor: "Point01") {
                    Text("인증 사진 업로드")
                        .foregroundColor(Color("GrayScale10"))
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.bottom, 30)
                
                // MARK: 화면 중앙의 미션 정보
                MissionInfoView()
                
                // MARK: 중앙의 사진 업로드 버튼
                Button {
                    mainModel.missionImageUpload.toggle()
                } label: {
                    if let profileImage = mainModel.missionProfileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .frame(width: 331, height: 331)
                            .cornerRadius(20)
                            .scaledToFill()
                            .shadow(color: .black, radius: 1, x: 4, y: 4)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black, lineWidth: 1)
                                }
                            } else {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 331, height: 331)
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 1, x: 4, y: 4)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.black, lineWidth: 1)
                                        
                                        Image(systemName: "photo")
                                            .foregroundColor(.black)
                                            .font(.system(size: 45))
                                    }
                            }
                }
                .sheet(isPresented: $mainModel.missionImageUpload) {
                    ImagePic(selectedImage: $mainModel.missionProfileImage)
                }
                
                Spacer()
            } // VStack
            .padding(.horizontal, 20)
            
            // MARK: 화면 가장 하단의 업로드 버튼
            
            NavigationLink {
                MainTabView(mainModel: mainModel, vm: vm).tag(3).navigationBarBackButtonHidden()
                    .onAppear {
                            mainModel.isMission = true
                    }
            } label: {
                makeShadowEffectCircle(ciecleSize: 56) {
                    Image("IconUpload")
                }
            }
            .position(x: UIScreen.main.bounds.width * 0.9, y: UIScreen.main.bounds.height * 0.74)
            
//            Button {
//                mainModel.isMission.toggle()
//            } label: {
//                makeShadowEffectCircle(ciecleSize: 56) {
//                    Image("IconUpload")
//                }
//            }
//            .position(x: UIScreen.main.bounds.width * 0.9, y: UIScreen.main.bounds.height * 0.74)

            
            
        } // ZStack
        .navigationBarBackButtonHidden()
//        .navigationTitle("홈으로 이동")
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarItems(leading: NavigationLink(destination: {
//        MainTabView(mainModel: mainModel, vm: vm).tag(3).navigationBarBackButtonHidden()
//        }, label: {
//            Image(systemName: "chevron.backward")
//        }))
    }
    
    // TODO: 디바이스에 저장된 사진 선택
    func selectPhoto() {
        
    }
    
    // TODO: 디바이스에 저장된 사진을 업로드하는 로직 필요
    func uploadPhoto() {
        
    }
}




struct UploadPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoView(mainModel: MainViewModel(), vm: ChaListViewModel())
    }
}
