//
//  RatingView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import SwiftUI

struct RatingView: View {
    
    @StateObject var viewModel = RatingViewModel(
        fetchUsers: FetchingUsersService()
    )
    
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        
        List(viewModel.users) { user in
            
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
            
        }
        .padding()
        .alert("Error", isPresented: $viewModel.isError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "unknown error")
        }
    }
}

#Preview {
    RatingView()
}
