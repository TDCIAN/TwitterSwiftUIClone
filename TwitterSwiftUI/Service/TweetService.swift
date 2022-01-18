//
//  TweetService.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/19.
//

import Firebase

struct TweetService {
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data: [String: Any] = [
            "uid": uid,
            "caption": caption,
            "likes": 0,
            "timestamp": Timestamp(date: Date())
        ]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error {
                    print("DEBUG uploadTweet error: \(error.localizedDescription)")
                    completion(false)
                } else {
                    print("DEBUG Uploaded new tweet ")
                    completion(true)
                }                
            }
    }
}
