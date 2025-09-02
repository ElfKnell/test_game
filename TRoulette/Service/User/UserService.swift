//
//  UserService.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation
import Firebase
import Observation

@Observable
class UserService: UserServiceProtocol {
    
    private let collectionName = "users"
    
    var user: User?
    
    func fetchUser(withUid uid: String) async throws {
        
        let snapshot = try await Firestore.firestore()
            .collection(collectionName)
            .document(uid)
            .getDocument()
        
        guard let data = snapshot.data() else {
            throw NSError(domain: "FirestoreError",
                          code: -1,
                          userInfo: [NSLocalizedDescriptionKey: "Document data is nil"])
        }
            
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
        let user = try JSONDecoder().decode(User.self, from: jsonData)
        print(user.id)
        self.user = user
        
    }
    
    func logOut() {
        self.user = nil
        print("------------------------------------")
    }
    
    func deleteUser(userId: String) async throws {
        
        try await Firestore.firestore()
            .collection(collectionName)
            .document(userId)
            .delete()
        
        self.user = nil
    }

}
