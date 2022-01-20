//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/15.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.tweet.user {
                // profile image + user info + tweet
                HStack(alignment: .top, spacing: 12) {
                    if let imageUrl = user.profileImageUrl {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 56, height: 56)
                            .clipShape(Circle())
                    }
                    
                    // user info & tweet caption
                    VStack(alignment: .leading, spacing: 4) {
                        
                        // user info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        // tweet caption
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            // action buttons
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bubble.left")
                        .font(.headline)
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.headline)
                })
                
                Spacer()
                
                Button(action: {
                    (viewModel.tweet.didLike ?? false) ? viewModel.unlikeTweet() : viewModel.likeTweet()
                }, label: {
                    Image(systemName: (viewModel.tweet.didLike ?? false) ? "heart.fill" : "heart")
                        .font(.headline)
                        .foregroundColor( (viewModel.tweet.didLike ?? false) ? Color(.systemRed) : .gray)
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bookmark")
                        .font(.headline)
                })
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

