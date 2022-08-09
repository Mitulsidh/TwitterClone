//
//  User.swift
//  TwitterClone


import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    
    // variable name should be same in order to get data
    
    @DocumentID var id: String?
    let email: String
   
    let fullname: String
    let profileImageURL: String
    let username: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
