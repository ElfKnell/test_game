//
//  LoginViewModel.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Observation

@Observable
class LoginViewModel {
    
    var email = ""
    var password = ""
    
    var isLoginError = false
    var errorMessage: String?
    
    func login(container: AuthServiceProtocol) async {
        
        do {
            
            guard !email.isEmpty,
                  !password.isEmpty else {
                errorMessage =
                "Please enter email and password"
                isLoginError = true
                return
            }
            
            try await container.login(
                withEmail: email,
                password: password
            )
        } catch {
            errorMessage = error.localizedDescription
            isLoginError = true
        }
    }
    
}
