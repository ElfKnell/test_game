//
//  DIContainer.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

@MainActor
final class DIContainer: ObservableObject {
    
    var authService: AuthServiceProtocol
    var userService: UserServiceProtocol
    
    init() {
        self.userService = UserService()
        self.authService = AuthService(userServise: self.userService)
    }
    
}
