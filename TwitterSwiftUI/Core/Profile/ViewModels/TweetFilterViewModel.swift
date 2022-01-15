//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/15.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets:
            return "Twees"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
}
