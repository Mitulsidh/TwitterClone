//
//  TwitterCloneApp.swift
//  TwitterClone


import SwiftUI
import Firebase


@main
struct TwitterCloneApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
//                ProfilePhotoSelectorView()
//                NewTweetView()

                
            }
            .environmentObject(viewModel)
        }
    }
}
