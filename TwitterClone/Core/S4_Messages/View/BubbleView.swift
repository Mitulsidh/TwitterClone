//
//  BubbleView.swift
//  TwitterClone


import SwiftUI
import Firebase
import Kingfisher

struct BubbleView: View {
    var message: Message
    var viewModel: MessageChatViewModel
    var uid = Auth.auth().currentUser?.uid
    
    init(_ message: Message, _ viewModel: MessageChatViewModel) {
        self.message = message
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(alignment: uid == message.fromId ? .trailing : .leading) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(uid == message.fromId ? Color(.blue) : Color(.gray))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                
            }
            .frame(maxWidth: 300, alignment: uid == message.fromId ? .trailing : .leading)
        }
        .frame(maxWidth: .infinity, alignment:  uid == message.fromId ? .trailing : .leading)
        .padding(uid == message.fromId ? .trailing : .leading)
        .padding(.horizontal, 10)
    }
}

//struct BubbleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleView(message: Message(id: "12345", text: "javsdjv jnfJF ASdvb JFDV svhdbvhf JVNJSVHJF vjsdvdjvh vvjdhsv sahvvj avsdhjv vshvv hv ssdhv vhd vdhv v v vdvh v", fromId: "sbavhdbvhb", toId: "jsbvbjbv", timestamp: nil))
//    }
//}


