//
//  Messages.swift
//  TwitterClone


import SwiftUI

struct MessagesMain: View {
    @ObservedObject var viewModel = MessageViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUsers) { user in
                        NavigationLink {
                            MessageChatView(user: user)
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

struct Messages_Previews: PreviewProvider {
    static var previews: some View {
        MessagesMain()
    }
}
