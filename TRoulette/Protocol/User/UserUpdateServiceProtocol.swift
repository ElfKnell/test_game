//
//  UserUpdateServiceProtocol.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation

protocol UserUpdateServiceProtocol {
    
    func updateUserProfile(user: User) async throws
    
}
