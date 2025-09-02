//
//  UserCreateService.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation
import Firebase

class UserCreateService: UserCreateServiceProtocol {
    
    private let collectionName = "users"
    
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

    }
    
}
