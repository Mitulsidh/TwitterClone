//
//  Message.swift
//  TwitterClone



import Foundation

class MessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var searchText = ""
    let service = UserService()
    
    var searchableUsers: [User] {
        
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
           
            
        }
    }
    
}
