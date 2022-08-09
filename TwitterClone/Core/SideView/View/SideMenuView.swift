//
//  SideMenuView.swift
//  TwitterClone


import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading, spacing:  32) {
            if let user = viewModel.currentUser {
                
                    VStack(alignment: .leading) {
                        KFImage(URL(string: user.profileImageURL))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 58, height: 48)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.headline)
                            Text("@\(user.username)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        UserStatsView()
                            .padding(.vertical)
                    }
                    .padding(.leading)
                    
                        ForEach(SideMenuViewModel.allCases, id: \.rawValue) { option in
                            
                            if option == .profile {
                                NavigationLink {
                                    ProfileView(user: user)
                                } label: {
                                    SideMenuOptionRowView(viewModel: option)
                                }
                            } else if option == .logout {
                                Button {
                                    viewModel.signOut()
                                } label: {
                                    SideMenuOptionRowView(viewModel: .logout)
                                }

                            } else {
                                SideMenuOptionRowView(viewModel: option)
                            }
                              
                        
                    }
                        
                        Spacer()
                
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
