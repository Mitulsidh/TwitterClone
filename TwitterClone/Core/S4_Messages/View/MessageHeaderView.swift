//
//  MessageHeaderView.swift
//  TwitterClone

import SwiftUI

struct MessageHeaderView: View {
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            HStack(spacing: 20) {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.green)
                
                VStack(alignment: .leading) {
                    Text("okay done")
                        .font(.title).bold()
                        .foregroundColor(.white)
                    
                    Text("@okay")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                Spacer()
                
                Image(systemName: "cross.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    

            }
            .padding()
        
        }
        .frame(height: 96)
    }
}

struct MessageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MessageHeaderView()
    }
}
