//
//  FetchingUsersServiceProtocol.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

protocol FetchingUsersServiceProtocol {
    
    func fetchUsers(withId currentUserId: String) async throws -> [User]
    
}
