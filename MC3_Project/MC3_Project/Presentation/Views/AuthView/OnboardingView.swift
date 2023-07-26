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
                Image("OnboardingBackImage").ignoresSafeArea()
                VStack {
                    VStack(alignment: .center, spacing: 0) {
                        Text("자연스러운 우리의 만남")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        Text("우연히 연인을")
                            .font(.system(size: 44))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 12)
                        
                        Text("만나보세요")
                            .font(.system(size: 44))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }.padding(.top, 80)
                    
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
                            .padding(.top, 360)
                    }
                    
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
                            .padding(.top, 13)
                    }
                    Spacer()
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
