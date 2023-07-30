//
//  LaunchView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct LaunchView: View {
    // MARK: - Properties
    @ObservedObject var viewModel = AuthViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                    Image("modifyLaunchImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
        
                    VStack{
                        Spacer()
                        
                        NavigationLink {
                            OnboardingView(viewModel: viewModel).navigationBarBackButtonHidden()
                        } label: {
                            Image("Start")
                        }
                        .padding(.bottom, 70)
                    }
                }
                .ignoresSafeArea()
                .onAppear {
                    requestNotificationPermission()
                }
            }
       
    }
    
    func requestNotificationPermission(){
           UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
               if didAllow {
                   print("Push: 권한 허용")
               } else {
                   print("Push: 권한 거부")
               }
           })
       }

}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
