//
//  TRouletteRootView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import SwiftUI

struct TRouletteRootView: View {
    
    @StateObject var viewModel = TRouletteRootViewModel()
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        
        Group {
            if container.userService.user != nil {
                TRouletteTabBar()
            } else {
                LoginView()
            }
        }
        .task {
            await viewModel
                .checkSession(container: container)
        }
    }
}

#Preview {
    TRouletteRootView()
}
