//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/18.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(
                title1: "Create your account",
                title2: "Add a profile photo"
            )
            
            Button(action: {
                print("Pick image here")
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
            })
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
