//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/18.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(
                title1: "Setup account",
                title2: "Add a profile photo"
            )
            
            Spacer().frame(height: 44)
            
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                if let profileImage = profileImage {
                    profileImage
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 180, height: 180)
                        .scaledToFill()
                        .foregroundColor(Color(.systemBlue))
                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus.circle")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 180, height: 180)
                        .scaledToFill()
                        .foregroundColor(Color(.systemBlue))
                }

            })
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button(action: {
                    viewModel.uploadProfileImage(selectedImage)
                }, label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
        print("??????????????? ?????? - profileImage: \(profileImage), selectedImage: \(selectedImage)")
        viewModel.uploadProfileImage(selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
