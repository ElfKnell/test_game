//
//  UserService.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation
import Firebase

class UserService: UserServiceProtocol {
    
    private let collectionName = "users"
    
    var user: User?
    
    func uploadUserData(id: String, withEmail email: String, username: String) async throws {
        
        let user = User(id: id,
                        username: username,
                        email: email,
                        numberChips: 2000,
                        wins: 0,
                        totalGames: 0)
        
        let userData = try user.toFirestoreData()
        
        try await Firestore.firestore()
            .collection(collectionName)
            .document(id)
            .setData(userData)
        
        try await fetchUser(withUid: id)
    }
    
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
        self.user = user
        
    }
    
    func deleteUser(userId: String) async throws {
        
        try await Firestore.firestore()
            .collection(collectionName)
            .document(userId)
            .delete()
        
    }

}
