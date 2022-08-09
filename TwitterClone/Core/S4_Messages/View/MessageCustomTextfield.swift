//
//  MessageCustomTextfield.swift
//  TwitterClone


import SwiftUI


struct MessageCustomTextfield: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "photo.on.rectangle")
                .foregroundColor(.white)
            
            TextField("Enter Message...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                
                Button {
                    print("DEBUG: message \(text)")
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

struct MessageCustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        MessageCustomTextfield(text: .constant(""))
    }
}


