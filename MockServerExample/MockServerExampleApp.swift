//
//  MockServerExampleApp.swift
//  MockServerExample
//
//  Created by Heliodoro Tejedor Navarro on 7/15/22.
//

import SwiftUI

@main
struct MockServerExampleApp: App {
    @StateObject var authService = AuthService()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authService)
        }
    }
}
