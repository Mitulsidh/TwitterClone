//
//  TweetRowView.swift
//  TwitterClone


import SwiftUI
import Kingfisher
// for single tweet cell design

struct TweetRowView: View {
    
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet)  {
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let user = viewModel.tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    
                    // For Image
                    KFImage(URL(string: user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    // User info + Tweet
                    VStack(alignment: .leading, spacing: 4) {
        
                        // User info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        // Tweet
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                }
                HStack(alignment: .top, spacing: 12) {
                    
                    Spacer()
                    
                    if let tweetImageUrl = viewModel.tweet.tweetImageUrl {
                        if !tweetImageUrl.isEmpty {
                            KFImage(URL(string: tweetImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 400)
                                
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .padding(10)
                        }
                    }
              
                    
                }
            
            }
        
        // Comment  + share + like buttons
        HStack {
            Button {
                
            } label: {
                Image(systemName: "bubble.left")
                    .font(.subheadline)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .font(.subheadline)
            }
            Spacer()
            Button {
                viewModel.tweet.didLike ?? false ? viewModel.unlikeTweet() : viewModel.likeTweet()
            } label: {
                Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                    .font(.subheadline)
                    .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "bookmark")
                    .font(.subheadline)
            }

        }
        .padding()
        .foregroundColor(.gray)
            
        Divider()
        }
            }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
