//
//  UploadtweetViewModel.swift
//  TwitterClone


import Foundation
import UIKit


class UploadTweetViewModel: ObservableObject {
    
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String,Timage image: UIImage?) {
    
        
        var TweetImageURL = ""
        
        if let image = image {
            ImageUploader.uploadImage(image: image) { tweetImageUrl in
               print("DEBUG: 1 tweet image url \(tweetImageUrl)")
                self.service.uploadTweet(caption: caption, tweetImageurl: tweetImageUrl) { success in
                    
                    if success {
                        self.didUploadTweet = true
                    }
                }
             }
            
            } else {
                service.uploadTweet(caption: caption, tweetImageurl: TweetImageURL) { success in
                    
                    if success {
                        self.didUploadTweet = true
                    }
                    print("DEBUG: 2 IMAGE URL \(TweetImageURL)")
        }
 
      }
    }
}
