//
//  TRouletteRootViewModel.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation

class TRouletteRootViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var isError = false
    @Published var errorMessage: String?


    @MainActor
    func checkSession(container: DIContainer) async {
        
        self.errorMessage = nil
        self.isError = false
        
        do {
            
            try await container.authService.checkUserSession()
            
        } catch {
            self.errorMessage = error.localizedDescription
            self.isError = true
        }
    }
}
