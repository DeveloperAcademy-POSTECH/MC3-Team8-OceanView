//
//  FirebaseUtil.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseCore
import FirebaseAuth

class FirebaseManager: NSObject {
    let auth: Auth
    let storage : Storage
    let firestore: Firestore
    
    //스스로의 객체 - 인스턴스(싱글톤)
    static let shared = FirebaseManager()
    
    //객체 생성시 자동호출
    override init() {
        FirebaseApp.configure() // GoogleService-Info 연결 환경설정 함수
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super.init()
    }
}
