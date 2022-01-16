//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/15.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
        }
    }
}
