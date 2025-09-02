//
//  TRouletteRootView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import SwiftUI

struct TRouletteRootView: View {
    
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        
        if let user = container.userService.user {
            TRouletteTabBar()
        } else {
            LoginView()
        }
    }
}

#Preview {
    TRouletteRootView()
}
