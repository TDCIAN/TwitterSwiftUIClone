//
//  User.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/19.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String?
    let email: String
}
