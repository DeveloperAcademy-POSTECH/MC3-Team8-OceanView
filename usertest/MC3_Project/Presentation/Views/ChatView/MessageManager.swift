//
//  MessageManager.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/26.
//

import SwiftUI
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    @Published var currentUserNickName: String?
    
    let db = FirebaseManager.shared.firestore
    
    init() {
        fetchCurrentUserNickName()
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetchnig documents: \(error)")
                return
            }
            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            
            self.messages.sort{ $0.timestamp < $1.timestamp}
            
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    
    func sendMessage(text: String, userName: String, profileImageUrl: String) {
        do {
            let newMessage = Message(id: "\(UUID())", userName: userName, text: text, received: false, timestamp: Date(), profileImageUrl: profileImageUrl)
            
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
    
    
    func fetchCurrentUserNickName() {
        if let currentUser = FirebaseManager.shared.auth.currentUser {
            let userUID = currentUser.uid
            db.collection("users").document(userUID).getDocument { document, error in
                if let document = document, document.exists {
                    if let nickName = document.data()?["userName"] as? String {
                        self.currentUserNickName = nickName
                    }
                } else {
                    print("User document not found: \(error)")
                }
            }
        } else {
            print("No current user")
        }
    }
    
}
