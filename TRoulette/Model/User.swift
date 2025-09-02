//
//  User.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

struct User: Identifiable, Codable, Hashable, Equatable {
    
    let id: String
    let username: String
    let email: String
    var numberChips: Int
    var wins: Int
    var totalGames: Int
    
    var winRate: Double {
        totalGames == 0 ? 0 : (Double(wins) / Double(totalGames)) * 100
    }
}
