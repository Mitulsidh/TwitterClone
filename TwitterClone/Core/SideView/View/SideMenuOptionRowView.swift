//
//  SideMenuOptionRowView.swift
//  TwitterClone


import SwiftUI

struct SideMenuOptionRowView: View {
    
    let  viewModel: SideMenuViewModel
    var body: some View {
        HStack{
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.description)
                .foregroundColor(.black)
                .font(.subheadline)
                
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
