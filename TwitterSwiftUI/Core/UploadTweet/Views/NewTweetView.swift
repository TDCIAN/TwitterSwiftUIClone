//
//  NewTweetView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/17.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                })
                
                Spacer()
                
                Button(action: {
                    print("Tweet")
                }, label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                })
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
            }
            .padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
