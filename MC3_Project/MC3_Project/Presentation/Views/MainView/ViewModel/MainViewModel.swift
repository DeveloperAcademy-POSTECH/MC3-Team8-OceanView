//
//  MainViewModel.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import Foundation
import SwiftUI

// 사용자 정보를 저장할 데이터 모델

struct UserInformation {
    var email: String
    var gender: String
    var group: Int
    var isParticipated: Bool
    var profileImageUrl: String
    var userID: String
    var userName: String
    var userSignal: String
    var waitingMatching: Bool

}

class MainViewModel: ObservableObject {
    @Published var userInformation: UserInformation?
    @Published var profileImage: Image? = nil
    
    let db = FirebaseManager.shared.firestore
    
    init() {
        fetchUserInformation()
    }
    
    // 참가버튼 업데이트
    func updateIsParticipated() {
        // 현재 사용자의 uid 가져오기
        if let currentUser = FirebaseManager.shared.auth.currentUser {
            let uid = currentUser.uid
            
            // 사용자 컬렉션의 도큐먼트 업데이트
            db.collection("users").document(uid).updateData([
                "isParticipated": self.userInformation?.isParticipated ?? false ? false : true
            ]) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated")
                    self.userInformation?.isParticipated.toggle() // UI의 상태도 업데이트
                }
            }
        }
    }
    
    
    func fetchUserInformation() {
            // 현재 사용자의 uid 가져오기
        if let currentUser = FirebaseManager.shared.auth.currentUser {
                let uid = currentUser.uid
                
                // 사용자 컬렉션에서 해당 사용자의 도큐먼트 가져오기
            db.collection("users").document(uid).getDocument { [self] (document, error) in
                    if let document = document, document.exists {
                        // 도큐먼트의 데이터를 가져와 UserInformation 모델에 매핑하여 저장
                        if let data = document.data(),
                           let email = data["email"] as? String,
                           let userName = data["userName"] as? String,
                           let userID = data["userID"] as? String,
                           let gender = data["gender"] as? String,
                           let group = data["group"] as? Int,
                           let userSignal = data["userSignal"] as? String,
                           let isParticipated = data["isParticipated"] as? Bool,
                           let waitingMatching = data["waitingMatching"] as? Bool,
                           let profileImageUrl = data["profileImageUrl"] as? String {
                            
                            // 사용자 정보를 UserInformation 모델에 저장
                            let userInfo = UserInformation(email: email, gender: gender, group: group, isParticipated: isParticipated, profileImageUrl: profileImageUrl, userID: userID, userName: userName, userSignal: userSignal, waitingMatching: waitingMatching)
                            
                            // UI에 사용자 정보 표시
                            DispatchQueue.main.async {
                                self.userInformation = userInfo
                                self.loadImageFromUrl(url: URL(string: profileImageUrl)!)
                            }
                        }
                    }
                }
            }
        }
    
    func loadImageFromUrl(url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let uiImage = UIImage(data: data) {
                // 가져온 데이터를 SwiftUI의 Image로 변환하여 업데이트
                DispatchQueue.main.async {
                    self.profileImage = Image(uiImage: uiImage)
                }
            }
        }.resume()
    }
    
}
