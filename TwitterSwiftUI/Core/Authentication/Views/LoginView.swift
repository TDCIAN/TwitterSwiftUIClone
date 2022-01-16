//
//  LoginView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/17.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            // parent container
            VStack {
                // header view
                AuthHeaderView(title1: "Hello.", title2: "Welcome back")
                
                VStack(spacing: 40) {
                    CustomInputField(
                        imageName: "envelope",
                        placeholderText: "Email",
                        text: $email
                    )
                    
                    CustomInputField(
                        imageName: "lock",
                        placeholderText: "Password",
                        text: $password
                    )
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                HStack {
                    Spacer()
                    
                    NavigationLink(
                        destination: {
                            Text("Reset password view")
                        }, label: {
                            Text("Forgot Password?")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(.systemBlue))
                                .padding(.top)
                                .padding(.trailing, 24)
                        }
                    )
                }
                
                Button(action: {
                    print("Sign in")
                }, label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                })
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                NavigationLink(
                    destination: {
                        RegistrationView()
                            .navigationBarHidden(true)
                    }, label: {
                        HStack {
                            Text("Don't have an account?")
                                .font(.footnote)
                            
                            Text("Sign Up")
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        .padding(.bottom, 32)
                        .foregroundColor(Color(.systemBlue))
                    }
                )
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
