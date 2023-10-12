//
//  LoggedView.swift
//  InactivtiyExample
//
//  Created by Heliodoro Tejedor Navarro on 7/15/22.
//

import Inactivity
import SwiftUI

struct LoggedView: View {
    @EnvironmentObject var authService: AuthService
    @State var count: Double = 50
    var username: String

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("This is your data")
                }
                
                Section {
                    Slider(value: $count, in: 0...100)
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Hello, \(username)")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        authService.logout()
                        InactivityWatcher.shared.inactivate()
                    } label: {
                        Text("Logout")
                    }
                }
            }
        }
        .onInactivityStateChanged { state in
            if state == .inactive && authService.isConnected {
                authService.logoutByInactivity()
            }
        }
    }
}

struct LoggedView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedView(username: "Test")
    }
}
