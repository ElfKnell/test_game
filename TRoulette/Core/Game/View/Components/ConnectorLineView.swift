//
//  ConnectorLineView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import SwiftUI

struct ConnectorLineView: View {
    
    let i: Int
    let selectedNumbers: [Int]?
    let selectAction: ([Int]) -> Void
    
    var body: some View {
        
        HStack {
            CheckmarkButtonView(
                number: [i, i+3],
                isSelected: selectedNumbers == [i, i+3],
                onTap: {
                    selectAction([i, i+3])
                }
            )
            
            CheckmarkButtonView(
                number: [i, i+1, i+3, i+4],
                isSelected: selectedNumbers == [i, i+1, i+3, i+4],
                onTap: {
                    selectAction([i, i+1, i+3, i+4])
                }
            )
            
            CheckmarkButtonView(
                number: [i+1, i+4],
                isSelected: selectedNumbers == [i+1, i+4],
                onTap: {
                    selectAction([i+1, i+4])
                }
            )
            
            CheckmarkButtonView(
                number: [i+1, i+2, i+4, i+5],
                isSelected: selectedNumbers == [i+1, i+2, i+4, i+5],
                onTap: {
                    selectAction([i+1, i+2, i+4, i+5])
                }
            )
            
            CheckmarkButtonView(
                number: [i+2, i+5],
                isSelected: selectedNumbers == [i+2, i+5],
                onTap: {
                    selectAction([i+2, i+5])
                }
            )
            
            CheckmarkButtonView(
                number: [i, i+1, i+2, i+3, i+4, i+5],
                isSelected: selectedNumbers == [i, i+1, i+2, i+3, i+4, i+5],
                onTap: {
                    selectAction([i, i+1, i+2, i+3, i+4, i+5])
                }
            )
        }
    }
}

#Preview {
    ConnectorLineView(i: 0,
                      selectedNumbers: nil,
                      selectAction: {_ in })
}
