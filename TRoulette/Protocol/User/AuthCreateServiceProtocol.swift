//
//  AuthCreateServiceProtocol.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

protocol AuthCreateServiceProtocol {
    
    func createUser(withEmail email: String,
                    password: String,
                    username: String) async throws -> String
    
}
