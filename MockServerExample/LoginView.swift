//
//  LoginView.swift
//  InactivtiyExample
//
//  Created by Heliodoro Tejedor Navarro on 7/15/22.
//

import Inactivity
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthService
    @AppStorage("lastUsername") var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                } header: {
                    Text("Credentials")
                } footer: {
                    Text("Remember: it is scott/tiger")
                }
                
                Section {
                    Button {
                        Task {
                            if await authService.login(username: username, password: password) {
                                InactivityWatcher.shared.startWatch(timeout: 5)
                            }
                        }
                    } label: {
                        Label("Login", systemImage: "arrow.forward.circle")
                    }
                }
                
                switch authService.status {
                case .error(let message):
                    Section {
                        Text(message)
                            .foregroundColor(.red)
                    }
                case .disconnectingByInactivity:
                    Section {
                        Text("Disconnected by inactivity")
                            .foregroundColor(.orange)
                    }
                default:
                    EmptyView()
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Login")
        }
        .disabled(authService.status == .connecting)
    }
}
