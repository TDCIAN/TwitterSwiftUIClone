//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/15.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        // no user logged in
        if viewModel.userSession == nil {
            LoginView()
        } else {
            // have a logged in user
            mainInterfaceView
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        NavigationView {
            Group {
                ZStack(alignment: .topLeading) {
                    MainTabView()
                        .navigationBarHidden(showMenu)
                    
                    if showMenu {
                        ZStack {
                            Color(.black)
                                .opacity(showMenu ? 0.25 : 0.0)
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showMenu = false
                            }
                        }
                        .ignoresSafeArea()
                    }
                    
                    SideMenuView()
                        .frame(width: 300)
                        .offset(x: showMenu ? 0 : -300, y: 0)
                        .background(showMenu ? Color.white : Color.clear)
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                self.showMenu.toggle()
                            }
                        }, label: {
                            Circle()
                                .frame(width: 32, height: 32)
                        })
                    }
                }
                .onAppear {
                    self.showMenu = false
                }
            }
        }
    }
}
