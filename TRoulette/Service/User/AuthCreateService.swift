//
//  AuthCreateService.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation
import FirebaseAuth

class AuthCreateService: AuthCreateServiceProtocol {
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String) async throws {
        
        let result = try await Auth.auth()
            .createUser(withEmail: email, password: password)
        let user =  result.user
        
        try await userService.uploadUserData(
            id: user.uid,
            withEmail: email,
            username: username
        )
    }
    
}
