//
//  UserUpdateService.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation
import Firebase

class UserUpdateService: UserUpdateServiceProtocol {
    
    func updateUserProfile(user: User) async throws {
        
        try await Firestore.firestore()
            .collection(collectionName)
            .document(user.id)
            .updateData([
                "numberChips": user.numberChips,
                "wins": user.wins,
                "totalGames": user.totalGames
            ])
    }
    
}
