//
//  AuthService.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService: AuthServiceProtocol {
    
    private let userServise: UserServiceProtocol
    
    init(userServise: UserServiceProtocol) {
        self.userServise = userServise
    }
    
    func login(withEmail email: String, password: String) async throws {
        
        let userData = try await Auth.auth().signIn(withEmail: email, password: password)
        
        try await userServise.fetchUser(withUid: userData.user.uid)
    }
    
    func signOut() throws {
        
        try Auth.auth().signOut()
        userServise.logOut()
        
    }
    
    func checkUserSession() async throws {
        
        if let user = Auth.auth().currentUser {
            
            _ = try await user.idTokenForcingRefresh(true)
            try await userServise.fetchUser(withUid: user.uid)
            
        }
        
    }
    
    func deleteUser(userId: String) async throws {
        
        guard let user = Auth.auth().currentUser else {
            throw NSError(
                domain: "AuthError",
                code: 401,
                userInfo: [NSLocalizedDescriptionKey: "No current user"]
            )
        }
        
        try await userServise.deleteUser(userId: user.uid)
            
        try await user.delete()
    }
    
}
