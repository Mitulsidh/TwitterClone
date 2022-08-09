//
//  AuthViewModel.swift
//  TwitterClone


import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init() {
        
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
        print("DEBUG: user session \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed with sign in: \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            self.userSession = user
            self.fetchUser()
            print("DEBUG: did log  in succesfully...")
            
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: failed with register \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            
            
            print("DEBUG: registered user succesfully")
            print("DEBUG: user is \(self.userSession)")
            
            self.tempUserSession = user
            
            let data = ["email" : email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                    print("DEBUG: did auth user true")
                }
        }

    
    }
    
    func signOut() {
        
        // sign out in user side
        userSession = nil
        // sign out in backend side
        try? Auth.auth().signOut()
        print("DEBUG: user signed out")
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        print("DEBUG: 1")
        
        ImageUploader.uploadImage(image: image) { profilrImageURL in
            print("DEBUG: 1.9")
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageURL": profilrImageURL]) { _ in
                    self.userSession = self.tempUserSession
                    print("DEBUG: 2")
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
