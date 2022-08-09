//
//  File.swift
//  TwitterClone


import Firebase


class MessageChatViewModel: ObservableObject {
    
    let user: User
    @Published var text = ""
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        print("DEBUG: 991")
        fetchMessages()
        print("DEBUG: 992")
        print("DEBUG: \(self.messages)")
        
    }
    
    func handleSend(text: String) {
        print("DEBUG: handle send \(text)")
        guard let fromId = Auth.auth().currentUser?.uid else { return }
        guard let toId = user.id else { return }
        
        if self.text.isEmpty {
            print("DEBUG: textfield empty")
            return
        }
        
        let data = ["fromId": fromId, "toId": toId, "text": text ,"timestamp": Timestamp(date: Date())] as [String: Any]
        
        Firestore.firestore().collection("messages")
            .document(fromId)
            .collection(toId)
            .document()
            .setData(data) { error in
                if let error = error {
                    print("DEBU: failed to upload message \(error.localizedDescription)")
                    return
                }
                print("DEBUG: did upload message")
            }
        Firestore.firestore().collection("messages")
            .document(toId)
            .collection(fromId)
            .document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: failed to upload message \(error.localizedDescription)")
                    return
                }
                
            }
        
        for i in 0 ..< messages.count {
            print("DEBUG: \(messages[i].text)")
            
        }
    }
    
    
    
    func fetchMessages() {
        guard let fromId = Auth.auth().currentUser?.uid else { return }
        guard let toId = user.id else { return }
        
        Firestore.firestore().collection("messages")
            .document(fromId)
            .collection(toId)
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("DEBUG: failed to downlod message \(error.localizedDescription)")
                    return
                }
                
                snapshot?.documentChanges.forEach({ change in
                    if change.type == .added {
                        print("DEBUG: 91")
                        if let data = try? change.document.data(as: Message.self) {
                            print("DEBUG: 92 \(data.text)")
                        self.messages.append(data)
                        }
                    }
                   
                })
            }
        
        for i in 0 ..< self.messages.count {
            print("DEBUG: \(self.messages[i].text)")
            
        }
        
    }
    
}
