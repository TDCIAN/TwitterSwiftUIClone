//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/15.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // user info & tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    // user info
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                        
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // tweet caption
                    Text("I believe in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
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
                    
                }, label: {
                    Image(systemName: "heart")
                        .font(.headline)
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

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
