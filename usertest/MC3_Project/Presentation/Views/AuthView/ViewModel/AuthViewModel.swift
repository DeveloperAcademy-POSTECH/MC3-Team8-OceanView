//
//  AuthViewModel.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/21.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthViewModel: ObservableObject {
    
    // MARK: - Properties
    let firestore: Firestore
    
    // DB 변수
    @Published var email = ""
    @Published var password = ""
    @Published var gender = ""
    @Published var userName = ""
    @Published var profileImageUrl = ""
    @Published var currentUser: Firebase.User?
    @Published var isActive = false
    
    // 이메일 변수
    @Published var textEmail: String = ""
    @Published var redundancyEmails = true
    @Published var isEmailduplicationID: Bool = true
    @Published var isEmailValid: Bool = false
    @Published var isEmailWarining: Bool = true
    
    // 패스워드 변수
    @Published var textPassword: String = ""
    @Published var textPasswordChecked: String = ""
    @Published var isPasswordValid: Bool = false
    @Published var isPasswordWarining: Bool = true
    @Published var passwordWariningColor: Bool = true
    
    // 닉네임 변수
    @Published var textNickname: String = ""
    @Published var isNicknameValid: Bool = false
    @Published var isNicknameWarining: Bool = true
    @Published var nicknameCheckedResult = true
    
    // 성별 변수
    @Published var textGender: String = ""
    @Published var isActivatedGender = true
    @Published var isGenderValid: Bool = false
    @Published var isWarining: Bool = true
    
    // 프로필 변수
    @Published var profileImage: UIImage?
    @Published var isShowingImagePicker = false
    @Published var selectedImage: UIImage?
    @Published var action: Int? = 0
    
    //로그인 변수
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    @Published var loginaction: Int? = 0
    @Published var signInProcessing: Bool = false
    @Published var isValidEmailandPassword: Bool = true
    @Published var LoginWarnig: Bool = true
    
    // MARK: - init
    init() {
        currentUser = FirebaseManager.shared.auth.currentUser
        self.firestore = FirebaseManager.shared.firestore
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.Mytheme.onbardingColor)]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(Color.Mytheme.onbardingColor)]
    }
    
    // MARK: - Functions
    
    // 로그인
    func login() {
        FirebaseManager.shared.auth.signIn(withEmail: self.loginEmail, password: self.loginPassword) { result, error in
            if let error = error {
                self.LoginWarnig = false
                print("Error : \(error.localizedDescription)")
                return
            }
            self.LoginWarnig = true
            self.currentUser = result?.user
            self.isActive = true
        }
    }
    
    // 로그아웃
    func logout() {
        currentUser = nil
        try?  FirebaseManager.shared.auth.signOut()
    }
    
    // 유저 등록
    func registerUser() {
        FirebaseManager.shared.auth.createUser(withEmail: self.email, password: self.password) { result, error in
            if let error = error {
                print("Error : \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            print(user.uid)
            
            let userInfo: [String: Any] = [
                "email": self.email,
                "userName": self.userName,
                "userID": user.uid,
                "gender": self.gender,
                "group": 0,
                "userSignal": "",
                "isParticipated": false,
                "waitingMatching" : false,
                "isMatched" : false,
                "profileImageUrl" : self.profileImageUrl
            ]
            
            FirebaseManager.shared.firestore.collection("users").document(user.uid).setData(userInfo) { error in
                if let error = error {
                    print("Error storing gender in Firestore: \(error.localizedDescription)")
                } else {
                    print("Gender stored in Firestore")
                }
            }
            
        }
    }
    
    // 이메일 유효성 검사
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // 이메일 중복체크
    func emailCheck(email: String) -> Bool {
        let userDB = FirebaseManager.shared.firestore.collection("users")
        // 입력한 이메일이 있는지 확인 쿼리
        let query = userDB.whereField("email", isEqualTo: email)
        query.getDocuments() { (qs, err) in
            if qs!.documents.isEmpty {
                self.isEmailduplicationID = true
            } else {
                self.isEmailduplicationID = false
            }
        }
        return self.isEmailduplicationID
    }
    
    //이메일 유료성 검사 버튼
    func validEmailButton() -> some View {
        if self.isEmailWarining && self.emailCheck(email: self.textEmail) {
            return Text(" ")
        }
        
        if (self.isEmailWarining == false && self.emailCheck(email: self.textEmail) == true) {
            if self.textEmail == "" {
                return  Text(" ")
            } else {
                return Text("유효하지 않은 이메일입니다.")
                    .font(.callout)
                    .foregroundColor(Color.red)
            }
        }
        
        if (self.isEmailWarining == true && self.emailCheck(email: self.textEmail) == false) {
            return Text("이메일이 중복 되었습니다.")
                .font(.callout)
                .foregroundColor(Color.red)
        }
        
        return Text("")
    }
    
    //키보드를 칠때 이메일이 유효
    func onChangeValidEamil() {
        if (self.isValidEmail(testStr: self.textEmail) == true && self.emailCheck(email: self.textEmail) == true) {
            self.isEmailWarining = true
            self.isEmailValid = true
            self.isEmailduplicationID = true
        } else if(self.isValidEmail(testStr: self.textEmail) == true && self.emailCheck(email: self.textEmail) == false) {
            self.isEmailWarining = true
            self.isEmailValid = false
            self.isEmailduplicationID = false
        } else {
            self.isEmailWarining = false
            self.isEmailValid = false
            self.isEmailduplicationID = true
        }
    }
    
    // 패스워드 유효성 검사
    private func isValidPassword(_ password : String) -> Bool{
        let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordTest.evaluate(with: password)
    }
    
    // 패스워드 작성시 검사
    func passwordCheck() {
        if isValidPassword(textPassword) || (textPassword.count > 6) {
            isPasswordWarining = true
            isPasswordValid = true
        } else {
            isPasswordValid = false
            isPasswordWarining = false
        }
    }
    
    // 패드워드 경고
    func passwordWarning() -> some View {
        if isPasswordWarining {
            return Text("6글자 이상, A-Z 대문자 구분")
        } else {
            if textPassword == "" {
                return Text("6글자 이상, A-Z 대문자 구분")
            } else {
                return Text("형식에 맞지 않는 패스워드입니다.")
            }
        }
    }
    
    // 패스워드 확인 경고창
    func passwordCheckWarning() -> some View {
        if textPassword == textPasswordChecked {
            if textPasswordChecked == "" {
                return Text("확인을 위해 한번 더 입력해 주세요.")
            } else {
                return Text("비밀번호가 일치합니다.")
            }
        } else {
            if textPasswordChecked == "" {
                return Text("확인을 위해 한번 더 입력해 주세요.")
            } else {
                return Text("비밀번호가 일치하지 않습니다.")
            }
        }
        
    }
    
    // 패스워드 확인란의 컬러지정
    func passwordCheckColor() -> Bool {
        if textPassword == textPasswordChecked {
            if textPasswordChecked == "" {
                return true
            } else {
                return true
            }
        } else {
            if textPasswordChecked == "" {
                return true
            } else {
                return false
            }
        }
    }
    
    // 닉네임 중복체크 함수
    func nicknameCheck(textNickname: String) -> Bool {
        let userDB = FirebaseManager.shared.firestore.collection("users")
        // 입력한 이메일이 있는지 확인 쿼리
        let query = userDB.whereField("userName", isEqualTo: textNickname)
        query.getDocuments() { (qs, err) in
            if qs!.documents.isEmpty {
                self.nicknameCheckedResult = true
            } else {
                self.nicknameCheckedResult = false
            }
        }
        return self.nicknameCheckedResult
    }
    
    // 닉네임 작성시 확인
    func nicknameCheckOnChange() {
        if (textNickname.count < 20) {
            isNicknameWarining = true
            isNicknameValid = true
        } else {
            isNicknameValid = false
            isNicknameWarining = false
        }
    }
    
    
    // 닉네임이 중복됐는지 확인
    func duplicateNicnameDatabase() -> some View {
        if isNicknameWarining && nicknameCheck(textNickname: textNickname) {
            return Text(" ")
        } else if isNicknameWarining == false && nicknameCheck(textNickname: textNickname) == true {
            return Text("닉네임은 20자를 넘을 수 없습니다.")
        } else {
            return Text("중복된 닉네임 입니다.")
        }
    }
    
    // 닉네임 중복시 텍스트 컬러
    func duplicateNicnameColorBool() -> Color {
        if nicknameCheckedResult && nicknameCheck(textNickname: textNickname) {
            return .clear
        } else if nicknameCheckedResult == false && nicknameCheck(textNickname: textNickname) == true {
            return .red
        } else {
            return .red
        }
    }
    
    // 유저 액션 스타트
    func registerUserAction() {
        
        guard let _ = profileImage else {
            print("이미지 선택이 안됨")
            // self.isShowAlert.toggle()
            return
        }
        
        
        FirebaseManager.shared.auth.createUser(withEmail: textEmail, password: textPassword) { authResult, error in
            if let error = error {
                print("회원가입 중 오류 발생 \(error.localizedDescription)")
                return
            }
            
            print("회원가입한 사용자 \(authResult?.user.email ?? "")")
            
            //가입시에 프로필 업로드 하고, 다른 뷰로 이동하는 로직을 짜기
            self.uploadImage()
        }
    }
    
    func uploadImage() {
        guard let safeProfileImage = profileImage else {
            print("이미지가 선택되지 않음")
            return
        }
        
        // 인증된 사용자임을 확인하는 과정 -> 로그인이 되어있는지
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            print("로그인이 안됨")
            return
        }
        
        let imagePath = "images/\(UUID().uuidString).jpg"
        uploadImageToStorage(safeProfileImage, path: imagePath) { result in
            switch result {
            case.success(let downloadURL):
                print("이미지 업로드 성공: \(downloadURL)")
                //이미지 업로드가 성공했을 때 유저 정보를 저장해주자.
                self.storeUserInformation(profileImageUrl: downloadURL, name: self.textNickname, selectedGenderIndex: self.textGender)
            case .failure(let error):
                print("이미지 업로드 실패: \(error.localizedDescription)")
            }
        }
        
    }
    
    func uploadImageToStorage(_ image: UIImage, path: String, completion: @escaping (Result<String, Error>) -> Void) {
        // 1.이미지 Data로 변환
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(.failure(NSError(domain: "ImageConversion", code: -1, userInfo: [NSLocalizedDescriptionKey:"Failed to convert image to data"])))
            
            return
        }
        
        // 2. Firebase 스토리지 참조 생성
        let storageRef = FirebaseManager.shared.storage.reference().child(path)
        
        // 3. 이미지 데이터 업로드
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                
                //오류 발생시
                completion(.failure(error))
                return
            }
            
            // 4. 다운로드 할 수 있는 URL 가져오기
            storageRef.downloadURL { url, error in
                if let error = error {
                    //오류 발생시
                    completion(.failure(error))
                    return
                }
                
                if let url = url {
                    // 다운로드 URL 성공적으로 가져옴
                    completion(.success(url.absoluteString))
                } else {
                    completion(.failure(NSError(domain: "DownloadURL", code: -1, userInfo: [NSLocalizedDescriptionKey:"Failed to get download URL"])))
                }
            }
        }
    }
    
    
    func storeUserInformation(profileImageUrl: String?, name: String?, selectedGenderIndex: String) {
        guard let profileImageUrl = profileImageUrl else {
            print("프로필 이미지 경로가 nil 입니다.")
            return
        }
        
        guard let name = name else {
            print("DB 저장시 : name이 nil입니다.")
            return
        }
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            print("로그인이 안됨")
            return
        }
        let userEmail = FirebaseManager.shared.auth.currentUser?.email ?? ""
        
        let userInfo: [String: Any] = [
            "email": userEmail,
            "userName": name,
            "userID": uid,
            "gender": selectedGenderIndex,
            "group": 0,
            "userSignal": "",
            "isMatched" : false,
            "isParticipated": false,
            "waitingMatching" : false,
            "profileImageUrl" : profileImageUrl
        ]
        
        // Dictionary 객체를 집어 넣어보자
        FirebaseManager.shared.firestore.collection("users").document(uid).setData(userInfo) { error in
            if let error = error {
                print("회원 정보 저장 중 오류 발생: \(error.localizedDescription)")
            } else {
                print("회원 정보 저장 성공")
                self.action = 1
            }
        }
    }
    
    
}
