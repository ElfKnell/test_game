//
//  SettingsView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import SwiftUI
import MessageUI

struct SettingsView: View {
    
    @State private var viewModel = SettingsViewModel()
    
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Support")) {
                
                if let url = viewModel.shareAppURL {
                    
                    ShareLink(item: url) {
                        
                        Label("Recommend TRoulette",
                              systemImage: "square.and.arrow.up")
                        
                    }
                    
                }
                
                Button {
                    viewModel.rateApp()
                } label: {
                    Label("Rate TRoulette", systemImage: "star.fill")
                }
                
                Button {
                    
                    if MFMailComposeViewController.canSendMail() {
                        viewModel.sendFeedbackEmail()
                    } else {
                        viewModel.showMailErrorAlert = true
                    }
                    
                } label: {
                    Label("Send Feedback via Email",
                          systemImage: "envelope.fill")
                }
                
                Section(header: Text("Аccount")) {
                    
                    Button {
                        viewModel.logOut(authService: container.authService)
                    } label: {
                        Label("Log out", systemImage: "arrow.up.and.person.rectangle.portrait")
                            .foregroundStyle(.black)
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button {
                        Task {
                            
                            if let userId = container
                                .userService
                                .user?.id {
                                
                                await viewModel.delete(userId, authService: container.authService)
                            }
                            
                        }
                    } label: {
                        Label("Delete account", systemImage: "xmark")
                            .foregroundStyle(.white)
                            .padding(12)
                            .frame(maxWidth: .infinity)
                            .background(Color.red.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
            }
            .alert("Email not configured", isPresented: $viewModel.showMailErrorAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Please set up a Mail account in order to send feedback.")
            }
        }
    }
}

#Preview {
    SettingsView()
}
