//
//  GameView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 01/09/2025.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel(
        updateServise: UserUpdateService()
    )
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        
        ScrollView {
            
            HStack {
                
                VStack {
                    
                    HStack {
                        
                        CheckmarkButtonView(
                            number: viewModel.numbers1to18,
                            isSelected: viewModel.selectedNumbers == viewModel.numbers1to18,
                            onTap: {
                                viewModel.selectArray(viewModel.numbers1to18)
                            }
                        )
                        
                        CheckmarkButtonView(
                            number: viewModel.numbers1to12, isSelected: viewModel.selectedNumbers == viewModel.numbers1to12,
                            onTap: {
                                viewModel.selectArray(viewModel.numbers1to12)
                            })
                    }
                    
                    CheckmarkButtonView(
                        number: viewModel.even,
                        isSelected: viewModel.selectedNumbers == viewModel.even,
                        onTap: {
                            viewModel.selectArray(viewModel.even)
                        })
                    
                    HStack {
                        CheckmarkButtonView(
                            number: viewModel.redNumbers, isSelected: viewModel.selectedNumbers == viewModel.redNumbers,
                            onTap: {
                                viewModel.selectArray(viewModel.redNumbers)
                            })
                        
                        CheckmarkButtonView(
                            number: viewModel.numbers13to24,
                            isSelected: viewModel.selectedNumbers == viewModel.numbers13to24,
                            onTap: {
                                viewModel.selectArray(viewModel.numbers13to24)
                            })
                    }
                    
                    CheckmarkButtonView(
                        number: viewModel.blackNumber,
                        isSelected: viewModel.selectedNumbers == viewModel.blackNumber,
                        onTap: {
                            viewModel.selectArray(viewModel.blackNumber)
                        })
                    
                    HStack {
                        CheckmarkButtonView(
                            number: viewModel.odd,
                            isSelected: viewModel.selectedNumbers == viewModel.odd,
                            onTap: {
                                viewModel.selectArray(viewModel.odd)
                            })
                        CheckmarkButtonView(
                            number: viewModel.numbers25to36,
                            isSelected: viewModel.selectedNumbers == viewModel.numbers25to36,
                            onTap: {
                                viewModel.selectArray(viewModel.numbers25to36)
                            })
                    }
                    
                    CheckmarkButtonView(
                        number: viewModel.numbers19to36,
                        isSelected: viewModel.selectedNumbers == viewModel.numbers19to36,
                        onTap: {
                            viewModel.selectArray(viewModel.numbers19to36)
                        })
                    
                }
                .padding(.horizontal)
                
                VStack {
                    
                    CheckmarkButtonView(
                        number: [0],
                        isSelected: viewModel.selectedNumbers == [0],
                        onTap: {
                            viewModel.selectArray([0])
                        })
                    
                    ForEach(Array(
                        stride(from: 1, to: 37, by: 3)),
                            id: \.self) { i in
                        
                        tripleLine(i: i)
                        
                        if i < 34 {
                            connectorLine(i: i)
                        }
                    }
                    
                    HStack {
                        
                        CheckmarkButtonView(
                            number: viewModel.numbers1,
                            isSelected: viewModel.selectedNumbers == viewModel.numbers1,
                            onTap: {
                                viewModel.selectArray(viewModel.numbers1)
                            })
                        
                        CheckmarkButtonView(
                            number: viewModel.numbers2,
                            isSelected: viewModel.selectedNumbers == viewModel.numbers2,
                            onTap: {
                                viewModel.selectArray(viewModel.numbers2)
                            })
                        
                        CheckmarkButtonView(
                            number: viewModel.numbers3,
                            isSelected: viewModel.selectedNumbers == viewModel.numbers3,
                            onTap: {
                                viewModel.selectArray(viewModel.numbers3)
                            })
                        
                    }
                }
            }
            .padding()
            
            VStack(spacing: 20) {
                
                if let totalChips = container
                    .userService
                    .user?
                    .numberChips {
                    
                    HStack {
                        
                        Stepper("BET: \(viewModel.value)",
                                value: $viewModel.value,
                                in: 10...totalChips,
                                step: 10)
                        .padding()
                        
                        Spacer()
                        
                        Button {
                            Task {
                                await viewModel.start(
                                    user: container
                                        .userService
                                        .user
                                )
                            }
                        } label: {
                            Text("START")
                                .foregroundStyle(.black)
                                .padding()
                                .frame(width: 170)
                                .background(Color.green.opacity(0.8))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding()
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
    
    @ViewBuilder
    func tripleLine(i: Int) -> some View {
        TripleLineView(
            i: i,
            selectedNumbers: viewModel.selectedNumbers,
            selectAction: viewModel.selectArray)
    }
    
    @ViewBuilder
    func connectorLine(i: Int) -> some View {
        ConnectorLineView(
            i: i,
            selectedNumbers: viewModel.selectedNumbers,
            selectAction: viewModel.selectArray)
    }
}

#Preview {
    GameView()
}
