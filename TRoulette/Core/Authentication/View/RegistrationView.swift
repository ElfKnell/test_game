//
//  RegistrationView.swift
//  TRoulette
//
//  Created by Andrii Kyrychenko on 02/09/2025.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var viewModel: RegistrationViewModel
    @EnvironmentObject var container: DIContainer
    
    init(viewModelBuilder: @escaping () -> RegistrationViewModel = {
        RegistrationViewModel(
            createAuth: AuthCreateService(
                userService: UserCreateService())
        )
    }) {
        self._viewModel = State(wrappedValue: viewModelBuilder())
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section(header: Text("Login Credentials")) {
                    
                    TextField("Username", text: $viewModel.username)
                        .autocorrectionDisabled(true)
                    
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textContentType(.password)
                }
                
                Section {
                    
                    Button {
                        Task {
                            await viewModel.register(container: container.userService)
                            
                            dismiss()
                        }
                    } label: {
                        Text("Create")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green.opacity(0.8))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    
                }
                
                Section {
                    
                    VStack(spacing: 8) {
                        
                        Text("Already have an account?")
                            .font(.system(size: 20))
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Sign in")
                                .bold()
                                .underline()
                                .font(.system(size: 23))
                                .foregroundStyle(.white)
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                }
                
            }
            .navigationTitle("Sign In")
            .alert("Login Error", isPresented: $viewModel.isCreateError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.errorMessage ?? "unknown error")
            }
        }
    }
}

#Preview {
    RegistrationView()
}
