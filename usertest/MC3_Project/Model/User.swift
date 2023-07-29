//
//  User.swift
//  MC3_Project
//
//  Created by Herry on 2023/07/21.
//

import Foundation

struct User: Identifiable {
    var id: UUID = UUID()
    var email: String
    var userName: String
    var gender: String
    var group: Int
    var userSignal: String
    var isParticipated: Bool
    var isqueuedUsers: Bool
}
