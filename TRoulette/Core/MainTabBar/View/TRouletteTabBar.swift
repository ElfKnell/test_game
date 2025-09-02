//
//  TRouletteTabBar.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import SwiftUI

struct TRouletteTabBar: View {
    
    @State private var mainSelectedTab = 0
    
    var body: some View {
        
        TabView(selection: $mainSelectedTab) {
            
            GameView()
                .tabItem {
                    Image(systemName: mainSelectedTab == 0 ? "arrowtriangle.right.circle.fill" : "arrowtriangle.right.circle")
                        .environment(\.symbolVariants, mainSelectedTab == 0 ? .fill : .none)
                }
                .tag(0)
            
            RatingView()
                .tabItem {
                    Image(systemName: mainSelectedTab == 1 ? "r.circle.fill" : "r.circle")
                        .environment(\.symbolVariants, mainSelectedTab == 1 ? .fill : .none)
                }
                .tag(1)
            
            SettingsView()
                .tabItem {
                    Image(systemName: mainSelectedTab == 2 ? "gearshape.circle.fill" : "gearshape.circle")
                        .environment(\.symbolVariants, mainSelectedTab == 2 ? .fill : .none)
                }
                .tag(2)
        }
    }
}

#Preview {
    TRouletteTabBar()
}
