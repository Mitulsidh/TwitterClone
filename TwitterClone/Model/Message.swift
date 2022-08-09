//
//  Message.swift
//  TwitterClone


import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    
    // variable name should be same in order to get data
    
    @DocumentID var id: String?
    let text: String
    let fromId: String
    let toId: String
    let timestamp: Timestamp?
}

