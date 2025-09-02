//
//  UserView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import SwiftUI

struct UserView: View {
    
    let user: User?
    
    var body: some View {
        
        if let user {
            
            HStack(alignment: .center, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(user.username)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    
                    Text(String(format: "%.2f", user.winRate))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    
                    Text("Chips")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text("\(user.numberChips)")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.blue)
                }
                
            }
            .padding()
            
        } else {
            
            Text("User not found")
                .font(.title)
                .foregroundStyle(.primary)
                .padding()
            
        }
    }
}

#Preview {
    UserView(user: nil)
}
