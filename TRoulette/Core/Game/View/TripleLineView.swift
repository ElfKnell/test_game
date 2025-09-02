//
//  TripleLineView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import SwiftUI

struct TripleLineView: View {
    
    let i: Int
    let selectedNumbers: [Int]?
    let selectAction: ([Int]) -> Void
    
    var body: some View {
        
        HStack {
            
            CheckmarkButtonView(
                number: [i],
                isSelected: selectedNumbers == [i],
                onTap: {
                    selectAction([i])
                })
            
            CheckmarkButtonView(
                number: [i, i+1],
                isSelected: selectedNumbers == [i, i+1],
                onTap: {
                    selectAction([i, i+1])
                })
            
            CheckmarkButtonView(
                number: [i+1],
                isSelected: selectedNumbers == [i+1],
                onTap: {
                    selectAction([i+1])
                })
            
            CheckmarkButtonView(
                number: [i+1, i+2],
                isSelected: selectedNumbers == [i+1, i+2],
                onTap: {
                    selectAction([i+1, i+2])
                })
            
            CheckmarkButtonView(
                number: [i+2],
                isSelected: selectedNumbers == [i+2],
                onTap: {
                    selectAction([i+2])
                })
            
            CheckmarkButtonView(
                number: [i, i+1, i+2],
                isSelected: selectedNumbers == [i, i+1, i+3],
                onTap: {
                    selectAction([i, i+1, i+3])
                })
        }
        
    }
}

#Preview {
    TripleLineView(i: 0,
                   selectedNumbers: nil,
                   selectAction: {_ in })
}
