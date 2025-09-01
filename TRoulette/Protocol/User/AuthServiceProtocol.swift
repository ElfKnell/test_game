//
//  AuthServiceProtocol.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

protocol AuthServiceProtocol {
    
    func login(withEmail email: String, password: String) async throws
    
    func signOut() throws
    
    func checkUserSession() async throws
    
    func deleteUser(userId: String) async throws
    
}
