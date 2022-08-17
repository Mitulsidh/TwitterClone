//
//  NewTweetView.swift
//  TwitterClone


import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @State private var caption = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    
    
    
    
    //new 1
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Button {
                    viewModel.uploadTweet(withCaption: caption, Timage: selectedImage)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageURL))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                
                TextArea("Type your text here!", text: $caption)
            }
            .padding()
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            // New 1
            
            
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .foregroundColor(Color(.systemBlue))
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                        
                } else {
                    
                    HStack() {
                        
                        
                        Image(systemName: "cross.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 120, height: 120)

                            .background(Color(.white))
                            
                            .clipShape(Circle())
                            .padding()
                        
                        
                    }
                    
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
        
        
        
        
        
        
        
        
        
        //new 1
        
        func loadImage() {
            guard let selectedImage = selectedImage else {
                return
            }
            
            profileImage = Image(uiImage: selectedImage)
     
        }
        
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
