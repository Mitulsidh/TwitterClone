//
//  ContentView.swift
//  TwitterClone


import SwiftUI
import Kingfisher

// file handles main tab view and side view

struct ContentView: View {
    
    // variable to present side view menu
    @State private var showMenu = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}


extension ContentView {
    
    var mainInterfaceView: some View {
        ZStack(alignment: .leading) {
            
            // main tab view
            MainTabView()
                .navigationBarHidden(showMenu)
            // black grey effext background when showing side menu
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0)
                }
                // to remove side menu when tapped on black grey background
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
             // side menu view
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                // shows side menu when tapped on icon on top left corner
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            
                            .frame(width: 32, height:32)
                            .clipShape(Circle())
                    }
                }
            }
            
        }
        // when returning from profile side view dissapear
        .onAppear {
            showMenu = false
        }
    }
}
