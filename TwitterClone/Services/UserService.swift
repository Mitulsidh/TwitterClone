//
//  UserService.swift
//  TwitterClone


import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                print("DEBUG: 61")
                guard let user = try? snapshot.data(as: User.self) else { return }
                print("DEBUG: 62")

                print("DEBUG: user username is \(user.username)")
                print("DEBUG: user email is \(user.email)")
                print("DEBUG: user imageurl is \(user.profileImageURL)")
                print("DEBUG: user fullname is \(user.fullname)")
                
                completion(user)
            }
    }
    
    
    
    
    
    func fetchUsers(completion: @escaping([User]) -> Void ) {
       
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let users = documents.compactMap({ try? $0.data(as: User.self)})
                completion(users)
            }
    }
}
