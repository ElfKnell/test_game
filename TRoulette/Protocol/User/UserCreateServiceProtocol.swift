//
//  UserCreateServiceProtocol.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation

protocol UserCreateServiceProtocol {
    
    func uploadUserData(id: String, withEmail email: String, username: String) async throws
    
}
