//
//  MessageChatView.swift
//  TwitterClone


import SwiftUI
import Kingfisher


struct MessageChatView: View {
    
    @ObservedObject var viewModel: MessageChatViewModel
    @Environment(\.presentationMode) var mode
    
    
    init(user: User) {
        self.viewModel = MessageChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            
            headerView
            
            ScrollView {
                
                ForEach(viewModel.messages) { message in
                    BubbleView(message, viewModel)
                        .padding()
                }
            }
            .padding(.top, 10)
            .background(Color.white)
            .cornerRadius(30, corners: [.topLeft,.topRight])
            
            customTextField
            
        }
        .background(Color(.systemBlue))
        .navigationBarHidden(true)
    }
}

struct MessageChatView_Previews: PreviewProvider {
    static var previews: some View {
        MessageChatView(user: User(id: "12345", email: "ok@gmail.com", fullname: "fullname", profileImageURL: "", username: "username"))
    }
}

extension MessageChatView {

var headerView: some View {
    
        
        HStack(spacing: 20) {
            KFImage(URL(string: viewModel.user.profileImageURL))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
            
            VStack(alignment: .leading) {
                Text(viewModel.user.fullname)
                    .font(.title).bold()
                    .foregroundColor(.white)
                
                Text("@\(viewModel.user.username)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Spacer()
            
            Button {
                mode.wrappedValue.dismiss()
            } label: {
            
                Image(systemName: "cross.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    
            }
            
            

        }
        .padding()
    
    
}
    
    var customTextField: some View {
     
            HStack {
                Image(systemName: "photo.on.rectangle")
                    .foregroundColor(.white)
                
                TextField("Enter Message...", text: $viewModel.text)
                    .padding(8)
                    .padding(.horizontal, 24)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    
                    Button {
                        viewModel.handleSend(text: viewModel.text)
                    } label: {
                        
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(minWidth: 30, maxWidth: 30, alignment: .trailing)
                            .cornerRadius(50)
                    }
                    
                
            }
            .padding(.horizontal, 4)
        }
    
    
    

}

