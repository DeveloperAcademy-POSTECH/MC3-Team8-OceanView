//
//  OnboardingView.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                Image("modifyLaunchImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                    
                    
                VStack {
                    Spacer()
                    
                    NavigationLink {
                        AuthEmailView(viewModel: viewModel).navigationBarBackButtonHidden()
                    } label: {
                        Text("회원가입")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(width: 360, height: 52)
                            .background(.white)
                            .cornerRadius(12)
                            .foregroundColor(Color.Mytheme.onbardingColor)
                        
                    }
                    .padding(.bottom, 16)
                    
                    NavigationLink {
                        LoginView(viewModel: viewModel).navigationBarBackButtonHidden()
                    } label: {
                        Text("로그인")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(width: 360, height: 52)
                            .background(.clear)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white, lineWidth: 2)
                            }
                        
                    }
                    .padding(.bottom, 150)
                    
                }
                }
               
            }
            
        }
    }

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View { 
        OnboardingView(viewModel: AuthViewModel())
    }
}
