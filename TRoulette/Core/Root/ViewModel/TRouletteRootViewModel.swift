//
//  TRouletteRootViewModel.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation

class TRouletteRootViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var errorMessage: String?


    @MainActor
    func checkSession(authService: AuthServiceProtocol) async {
        do {
            try await authService.checkUserSession()
            isLoggedIn = true
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
