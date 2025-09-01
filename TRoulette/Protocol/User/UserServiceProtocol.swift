//
//  UserServiceProtocol.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

protocol UserServiceProtocol {
    
    var user: User? { get }
    
    func uploadUserData(id: String,
                        withEmail email: String,
                        username: String) async throws
    
    func fetchUser(withUid uid: String) async throws
    
    func updateUserProfile(user: User) async throws
    
    func deleteUser(userId: String) async throws
    
}
