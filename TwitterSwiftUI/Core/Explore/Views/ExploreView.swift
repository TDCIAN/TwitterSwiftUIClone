//
//  ExploreView.swift
//  TwitterSwiftUI
//
//  Created by JeongminKim on 2022/01/15.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink(destination: {
                            ProfileView(user: user)
                        }, label: {
                            UserRowView(user: user)
                        })
                        
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}
