//
//  UserServiceProtocol.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

protocol UserServiceProtocol {
    
    var user: User? { get set }
    
    func fetchUser(withUid uid: String) async throws
    
    func deleteUser(userId: String) async throws
    
    func logOut()
}
