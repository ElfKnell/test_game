//
//  CheckmarkButtonView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import SwiftUI

struct CheckmarkButtonView: View {
    
    var number: [Int]
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        
        Button {
            onTap()
        } label: {
            
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isSelected ? .green : .gray)

        }
    }
}

#Preview {
    CheckmarkButtonView(
        number: [],
        isSelected: false,
        onTap: {}
    )
}
