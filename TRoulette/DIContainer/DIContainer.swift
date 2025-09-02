//
//  DIContainer.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

@MainActor
final class DIContainer: ObservableObject {
    
    let authService: AuthServiceProtocol
    @Published var userService: UserService
    
    init() {
        let userServise = UserService()
        self.userService = userServise
        self.authService = AuthService(userServise: userServise)
    }
    
}
