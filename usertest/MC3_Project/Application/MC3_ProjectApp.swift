//
//  MC3_ProjectApp.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/21.
//
import FirebaseCore
import SwiftUI

@main
struct MC3_ProjectApp: App {
    
    var body: some Scene {
        WindowGroup {
            LaunchView(viewModel: AuthViewModel())
        }
    }
}
