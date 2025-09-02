//
//  FetchingUsersService.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation
import Firebase

class FetchingUsersService: FetchingUsersServiceProtocol {
    
    func fetchUsers(withId currentUserId: String) async throws -> [User] {
        
        let snapshot = try await Firestore.firestore()
            .collection("users")
            .getDocuments()
        
        var users: [User] = []
        
        for document in snapshot.documents {
                
            let jsonData = try JSONSerialization
                .data(withJSONObject: document.data(), options: [])
            let user = try JSONDecoder().decode(User.self, from: jsonData)
            users.append(user)
        }
        
        return users.sorted(by: { $0.winRate > $1.winRate })
        
    }
    
}
