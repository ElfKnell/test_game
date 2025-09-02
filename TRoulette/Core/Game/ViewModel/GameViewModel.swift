//
//  GameViewModel.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var selectedNumbers: [Int]? = nil
    @Published var value = 10
    
    @Published var errorMessage: String?
    @Published var isError: Bool = false
    
    let redNumbers = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23, 25, 27, 30, 32, 34, 36]
    let blackNumber = [2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35]
    let even = Array(stride(from: 2, through: 36, by: 2))
    let odd = Array(stride(from: 1, through: 35, by: 2))
    let numbers1 = Array(stride(from: 1, through: 34, by: 3))
    let numbers2 = Array(stride(from: 2, through: 35, by: 3))
    let numbers3 = Array(stride(from: 3, through: 36, by: 3))
    let numbers1to18 = Array(1...18)
    let numbers19to36 = Array(19...36)
    let numbers1to12 = Array(1...12)
    let numbers13to24 = Array(13...24)
    let numbers25to36 = Array(25...36)
    
    private let updateServise: UserUpdateServiceProtocol
    
    init (updateServise: UserUpdateServiceProtocol) {
        self.updateServise = updateServise
    }
    
    func selectArray(_ numbers: [Int]) {
        selectedNumbers = selectedNumbers == numbers ? nil : numbers
    }
    
    func start(user: User?) async {
        
        errorMessage = nil
        isError = false
        
        do {
            guard var user = user else {
                throw UserError.userIsNil
            }
            
            let randomNumber = Int.random(in: 0...36)
            
            if let selectedNumbers, selectedNumbers.contains(randomNumber) {
                
                switch selectedNumbers.count {
                case 1:
                    user.numberChips += value * 35 + value
                case 2:
                    user.numberChips += value * 17 + value
                case 3:
                    user.numberChips += value * 11 + value
                case 4:
                    user.numberChips += value * 8 + value
                case 6:
                    user.numberChips += value * 5 + value
                case 12:
                    user.numberChips += value * 2 + value
                default:
                    user.numberChips += value * 2
                }
                
                user.totalGames += 1
                user.wins += 1
                
                try await updateServise.updateUserProfile(user: user)
                
            } else {
                
                user.totalGames += 1
                user.numberChips -= value
                
                if user.numberChips == 0 {
                    user.numberChips = 100
                }
                
                try await updateServise.updateUserProfile(user: user)
            }
        } catch {
            errorMessage = error.localizedDescription
            isError = true
        }
    }
}
