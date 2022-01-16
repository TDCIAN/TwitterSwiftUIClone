//
//  AuthViewModel.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/17.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        
    }
}
