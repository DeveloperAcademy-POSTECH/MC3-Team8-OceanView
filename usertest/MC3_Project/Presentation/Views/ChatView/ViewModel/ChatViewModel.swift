//
//  ChatViewModel.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/25.
//

import Foundation

struct ChatUser {
    let uid, userName, profileImageUrl: String
    let group: Int
}


class ChaListViewModel: ObservableObject {
    
    @Published var usersByGroup: [Int: [ChatUser]] = [:] // 그룹 번호별 사용자를 저장하는 딕셔너리
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    @Published var shouldShowMessageScreen = false
    @Published var users = [ChatUser]()
    
    init() {
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user"
                return
            }
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
            }
            
            let uid = data["uid"] as? String
            let userName = data["userName"] as? String
            let profileImageUrl = data["profileImageUrl"] as? String
            
            self.chatUser = ChatUser(uid: uid ?? "", userName: userName ?? "", profileImageUrl: profileImageUrl ?? "", group: 0)
            
        }
    }
    
}
