//
//  ImageUploader.swift
//  TwitterClone


import Firebase
import UIKit
import FirebaseStorage


struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.6) else { return }
        
        let filename = NSUUID().uuidString
        print("DEBUG: 1.1")
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        print("DEBUG: 1.2")
        
        ref.putData(imageData, metadata: nil) { _ , error in
            if let error = error {
                print("DEBUG: error uploading image \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageURL, _ in
                guard let imageURL = imageURL?.absoluteString else { return }
                completion(imageURL)
            }
            print("DEBUG: image uploaded in storage n url generated")
        }
    }
}
