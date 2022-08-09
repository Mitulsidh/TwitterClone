//
//  UserRowView.swift
//  TwitterClone


import SwiftUI
import Kingfisher

//reusable view for explore section

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageURL))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline).bold()
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserRowView()
//    }
//}
