//
//  UserError.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import Foundation

enum UserError: Error, LocalizedError {
    
    case userIsNil
    
    var errorDescription: String? {
        switch self {
        case .userIsNil:
            return "User not find."
        }
    }
}
