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
        
        VStack {
            
            UserView(user: container.userService.user)
            
            List(viewModel.users) { user in
                
                UserView(user: user)
                
            }
            
        }
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
