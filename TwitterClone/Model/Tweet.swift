//
//  Tweet.swift
//  TwitterClone


import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    var tweetImageUrl: String?
    
    var user: User?
    var didLike: Bool? = false
}
