//
//  MainTabView.swift
//  TwitterClone

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            //Tab 1
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            //Tab 2
            Explore()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            //Tab 3
            Notification()
                .onTapGesture {
                    self.selectedIndex = 2                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag(2)
            //Tab 4
            MessagesMain()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
