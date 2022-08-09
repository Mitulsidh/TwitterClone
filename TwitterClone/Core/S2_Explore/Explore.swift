//
//  Explore.swift
//  TwitterClone


import SwiftUI

struct Explore: View {
    
    @ObservedObject var viewModel = ExploreViewModel()
    
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink {
                                ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
