//
//  MainViewModel.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/23.
//

import Foundation
import SwiftUI
import Combine
// 사용자 정보를 저장할 데이터 모델

struct UserInformationGender: Identifiable {
    var id = UUID()
    var email: String
    var gender: String
    var group: Int
    var isParticipated: Bool
    var isMatched : Bool
    var profileImageUrl: String
    var userID: String
    var userName: String
    var userSignal: String
    var waitingMatching: Bool

}


struct UserInformation {
    var email: String
    var gender: String
    var group: Int
    var isParticipated: Bool
    var isMatched : Bool
    var profileImageUrl: String
    var userID: String
    var userName: String
    var userSignal: String
    var waitingMatching: Bool

}

class MainViewModel: ObservableObject {
    
    let group = DispatchGroup()
    
    @Published var selection: Int? = nil
    @Published var userInformation: UserInformation?
    @Published var profileImage: Image? = nil
    @Published var missionProfileImage: UIImage?
    @Published var missionImageUpload: Bool = false
    @Published var isMission: Bool = false
    @Published var isMatch: Bool = false
    @Published var goToMatchingView: Bool = false
    @Published var goToChatRoomCount: Int = 0
    @Published var goToChatRoom: Bool = false
    @Published var isChatRoomPresented = false
    @Published var heartUsers: [UserInformationGender?] = []
    @Published var heartMatchingView: Bool = false
    @Published var girlImg: String = ""
    @Published var boylImg: String = ""
    // 남성 사용자 정보를 담을 배열
    @Published var maleUsers: [UserInformationGender] = []
    
    // 여성 사용자 정보를 담을 배열
    @Published var femaleUsers: [UserInformationGender] = []
    
    @Published var isMatchedWithUser: Bool = false
    @Published var isMyUserSignalInTarget: Bool = false
    
    
    
    let db = FirebaseManager.shared.firestore
    
    init() {
        fetchUserInformation()
        fetchgenderInformation()
    }
    
    // 참가버튼 업데이트
    func updateIsParticipated() {
        // 현재 사용자의 uid 가져오기
        if let currentUser = FirebaseManager.shared.auth.currentUser {
            let uid = currentUser.uid
            
            // 사용자 컬렉션의 도큐먼트 업데이트
            db.collection("users").document(uid).updateData([
                "isParticipated" : self.userInformation?.isParticipated ?? false ? false : true
            ]) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated")
                    self.userInformation?.isParticipated.toggle()
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
                       let isMatched = data["isMatched"] as? Bool,
                       let profileImageUrl = data["profileImageUrl"] as? String {
                        
                        // 사용자 정보를 UserInformation 모델에 저장
                        let userInfo = UserInformation(email: email, gender: gender, group: group, isParticipated: isParticipated, isMatched: isMatched, profileImageUrl: profileImageUrl, userID: userID, userName: userName, userSignal: userSignal, waitingMatching: waitingMatching)
                        let userInfoGender = UserInformationGender(id: UUID(), email: email, gender: gender, group: group, isParticipated: isParticipated, isMatched: isMatched, profileImageUrl: profileImageUrl, userID: userID, userName: userName, userSignal: userSignal, waitingMatching: waitingMatching)
                        
                        // UI에 사용자 정보 표시
                        DispatchQueue.main.async {
                            self.userInformation = userInfo
                            self.loadImageFromUrl(url: URL(string: profileImageUrl)!)
                            
                            if gender == "남" {
                                self.maleUsers.append(userInfoGender) // 배열의 배열로 저장
                            } else {
                                self.femaleUsers.append(userInfoGender)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    func fetchgenderInformation() {
        // 사용자 컬렉션에서 모든 도큐먼트 가져오기
        db.collection("users").getDocuments { [self] (querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                return
            }

            // querySnapshot에서 도큐먼트들을 순회하며 사용자 정보를 가져와 배열에 저장
            for document in querySnapshot!.documents {
                if let data = document.data() as? [String: Any],
                   let email = data["email"] as? String,
                   let userName = data["userName"] as? String,
                   let userID = data["userID"] as? String,
                   let gender = data["gender"] as? String,
                   let group = data["group"] as? Int,
                   let userSignal = data["userSignal"] as? String,
                   let isParticipated = data["isParticipated"] as? Bool,
                   let waitingMatching = data["waitingMatching"] as? Bool,
                   let isMatched = data["isMatched"] as? Bool,
                   let profileImageUrl = data["profileImageUrl"] as? String {

                    let userInfoGender = UserInformationGender(id: UUID(), email: email, gender: gender, group: group, isParticipated: isParticipated, isMatched: isMatched, profileImageUrl: profileImageUrl, userID: userID, userName: userName, userSignal: userSignal, waitingMatching: waitingMatching)

                    // UI에 사용자 정보 표시
                    DispatchQueue.main.async {
                        if gender == "남" {
                            self.maleUsers.append(userInfoGender)
                        } else {
                            self.femaleUsers.append(userInfoGender)
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
    
    
    func setupFirestoreListener() {
        // Firestore의 "users" 컬렉션을 감시하여 변경 사항을 실시간으로 확인
        db.collection("users").addSnapshotListener { [weak self] snapshot, error in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "알 수 없는 오류")")
                return
            }
            
            // snapshot에서 사용자 정보를 가져와서 모든 사용자의 isParticipated가 true인지 확인
            let allParticipated = documents.allSatisfy { document in
                if let isParticipated = document["isParticipated"] as? Bool {
                    return isParticipated
                }
                return false
            }
            
            // 모든 사용자의 isParticipated가 true인 경우 isMatched를 true로 설정하여 특정 뷰로 전환
            DispatchQueue.main.async {
                self?.isMatch = allParticipated
            }
            
            if self?.goToChatRoomCount == 0 {
                self?.goToChatRoom = allParticipated
            }
        }
    }
    
    func sendHeart(to user: UserInformationGender) {
        if let currentUser = FirebaseManager.shared.auth.currentUser,
            let currentUserName = userInformation?.userName {
            
            let targetGender = user.gender
            let currentUserGender = userInformation?.gender ?? ""
            guard currentUserGender != targetGender else {
                print("You can only send a heart to users of a different gender.")
                return
            }
            
            // Update the userSignal field of the current user with the target user's userID
            db.collection("users").document(currentUser.uid).updateData([
                "userSignal": user.userID
            ]) { error in
                
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("UserSignal successfully updated")
                }
            }
        }
    }

    func setupFirestoreListenerForHartUser(hartUserUID: String) {
        // 현재 사용자의 UID 가져오기
        guard let currentUserUID = FirebaseManager.shared.auth.currentUser?.uid else {
            print("Error: Current user UID is nil.")
            return
        }

        group.enter()
        // Firestore의 "users" 컬렉션에서 하트를 누른 사용자의 도큐먼트를 감지
        db.collection("users").document(hartUserUID).addSnapshotListener { [weak self] (documentSnapshot, error) in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error?.localizedDescription ?? "알 수 없는 오류")")
                return
            }


            if document.exists {
                // 하트를 누른 사용자의 userSignal 값 가져오기
                let hartUserSignal = document["userSignal"] as? String

                // 현재 접속 유저의 userSignal 값 가져오기
                let currentUserSignal = self?.userInformation?.userSignal ?? ""

                // 상대방의 userSignal에 현재 접속 유저의 userID가 있는지 확인
                let isHartUserSignalContainsCurrentUser = (hartUserSignal == currentUserUID)

                // 현재 접속 유저의 userSignal에 하트를 누른 상대방의 userID가 있는지 확인
                let isCurrentUserSignalContainsHartUser = (self?.userInformation?.userSignal == hartUserUID)
                
//                let _ = print("hartUserSignal: \(hartUserSignal)")
//                let _ = print("self?.userInformation?.userID: \(self?.userInformation?.userID)")
//                let _ = print("self?.userInformation?.userSignal: \(self?.userInformation?.userSignal)")
//                let _ = print("document['userID'] as? String: \(document["userID"] as? String)")
                DispatchQueue.main.async {
                self?.girlImg = (document["profileImageUrl"] as? String)!
                self?.boylImg = self?.userInformation?.profileImageUrl ?? ""
                // 상대방의 userSignal에 현재 접속 유저의 userID가 있고, 현재 접속 유저의 userSignal에 하트를 누른 상대방의 userID가 있는 경우에 isMatchedWithUser를 true로 설정
                let isMatched = isHartUserSignalContainsCurrentUser && isCurrentUserSignalContainsHartUser

                    self?.isMatchedWithUser = isMatched
                }
                
                
            } else {
                print("Error: Document does not exist.")
            }
        }
    }

    
    
//    func checkMatchedWithUser(hartUserUID: String) {
//        // 현재 사용자의 UID 가져오기
//        guard let currentUserUID = FirebaseManager.shared.auth.currentUser?.uid else {
//            print("Error: Current user UID is nil.")
//            return
//        }
//
//        // Firestore의 "users" 컬렉션에서 하트를 누른 사용자의 도큐먼트 가져오기
//        db.collection("users").document(hartUserUID).getDocument { [weak self] (document, error) in
//            guard let document = document, document.exists else {
//                print("Error: Document does not exist.")
//                return
//            }
//
//            // 하트를 누른 사용자의 userSignal 값 가져오기
//               let hartUserSignal = document["userSignal"] as? String
//               let crrentUserID = self?.userInformation?.userID
//                // 현재 접속 유저의 userSignal 값 가져오기
//                let currentUserSignal = self?.userInformation?.userSignal ?? ""
//
//                // 상대방의 userSignal에 현재 접속 유저의 userID가 있는지 확인
//                let isHartUserSignalContainsCurrentUser = (hartUserSignal == crrentUserID)
//                let _ = print("hartUserSignal: \(hartUserSignal)")
//                let _ = print("self?.userInformation?.userID: \(self?.userInformation?.userID)")
//                let _ = print("self?.userInformation?.userSignal: \(self?.userInformation?.userSignal)")
//                let _ = print("document['userID'] as? String: \(document["userID"] as? String)")
//                // 현재 접속 유저의 userSignal에 하트를 누른 상대방의 userID가 있는지 확인
//                let isCurrentUserSignalContainsHartUser = (self?.userInformation?.userSignal == document["userID"] as? String)
//
//                // 상대방의 userSignal에 현재 접속 유저의 userID가 있고, 현재 접속 유저의 userSignal에 하트를 누른 상대방의 userID가 있는 경우에 isMatchedWithUser를 true로 설정
//                if isHartUserSignalContainsCurrentUser && isCurrentUserSignalContainsHartUser {
//                    DispatchQueue.main.async {
//                        self?.isMatchedWithUser = true
//                    }
//                }
//        }
//    }

    
}
