//
//  FeedView.swift
//  TwitterClone

// Screen for all tweets
import SwiftUI

//screen 1 with tweets


struct FeedView: View {
    
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack {
                    
                    ForEach(viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image(systemName: "cross.fill")
                    .foregroundColor(.white)
                    .frame(width: 55, height: 55)

                    .background(Color(.systemBlue))
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .padding()
            }
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
            

        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
