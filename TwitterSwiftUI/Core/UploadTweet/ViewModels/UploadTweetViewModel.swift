//
//  UploadTweetViewModel.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/19.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { isSuccess in
            if isSuccess {
                // dismiss screen
                self.didUploadTweet = true
            } else {
                // show error message to user
            }
        }
    }
}
