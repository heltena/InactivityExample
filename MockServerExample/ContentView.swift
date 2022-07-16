//
//  ContentView.swift
//  MockServerExample
//
//  Created by Heliodoro Tejedor Navarro on 7/15/22.
//

import Inactivity
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        Group {
            switch authService.status {
            case .connected(let username):
                LoggedView(username: username)
            default:
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
