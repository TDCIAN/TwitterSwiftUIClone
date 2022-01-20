//
//  FeedViewModel.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/20.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
            
            tweets.forEach { tweet in
                let uid = tweet.uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    
                }
            }
        }
    }
}

// [tweet1, tweet2, tweet3, tweet4]

