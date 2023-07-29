//
//  Message.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/25.
//

import Foundation

// 각 메세지에 Identifiable, 인코딩 디코딩 하게 해줌
struct Message : Identifiable , Codable{
    var id : String
    var userName: String
    var text : String
    var received : Bool
    var timestamp : Date
    var profileImageUrl: String
}
