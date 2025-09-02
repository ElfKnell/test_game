//
//  RatingViewModel.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation

class RatingViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    @Published var errorMessage: String?
    @Published var isError: Bool = false
    
    private let fetchUsers: FetchingUsersServiceProtocol
    
    init(fetchUsers: FetchingUsersServiceProtocol) {
        self.fetchUsers = fetchUsers
    }
    
    func fetchUsers(_ userID: String) async {
        
        self.errorMessage = nil
        self.isError = false
        
        do {
            
            self.users = try await fetchUsers.fetchUsers(withId: userID)
            
        } catch {
            self.errorMessage = error.localizedDescription
            self.isError = true
        }
    }
}
