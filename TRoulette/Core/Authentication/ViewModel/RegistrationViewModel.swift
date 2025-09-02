//
//  RegistrationViewModel.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Observation

@Observable
class RegistrationViewModel {
    
    var username = ""
    var email = ""
    var password = ""
    
    var isCreateError = false
    var errorMessage: String?
    
    private let createAuth: AuthCreateServiceProtocol
    
    init(createAuth: AuthCreateServiceProtocol) {
        self.createAuth = createAuth
    }
    
    func register(container: UserServiceProtocol) async {
        
        self.errorMessage = nil
        self.isCreateError = false
        
        do {
            
            if !email.isEmpty && !password.isEmpty && !username.isEmpty {
                
                let userId = try await createAuth.createUser(
                    withEmail: email,
                    password: password,
                    username: username
                )
                
                if !userId.isEmpty {
                    try await container.fetchUser(withUid: userId)
                    
                    email = ""
                    password = ""
                    username = ""
                }
            }
            
        } catch {
            self.errorMessage = error.localizedDescription
            self.isCreateError = true
        }
    }
}
