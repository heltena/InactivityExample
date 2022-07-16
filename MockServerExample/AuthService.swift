//
//  AuthService.swift
//  InactivtiyExample
//
//  Created by Heliodoro Tejedor Navarro on 7/15/22.
//

import Combine
import Foundation

@MainActor
class AuthService: ObservableObject {

    enum AuthStatus: Equatable {
        case disconnected
        case connecting
        case connected(String)
        case error(String)
        case disconnectingByInactivity
    }

    @Published private(set) var status: AuthStatus = .disconnected
        
    var isConnected: Bool {
        if case .connected = status {
            return true
        } else {
            return false
        }
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $status
            .removeDuplicates()
            .delay(for: .seconds(3), scheduler: RunLoop.main)
            .receive(on: DispatchQueue.main)
            .sink {
                switch $0 {
                case .error, .disconnectingByInactivity:
                    self.status = .disconnected
                default:
                    break
                }
            }
            .store(in: &cancellableSet)
    }
    
    func login(username: String, password: String) async -> Bool {
        status = .connecting
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)  // Sim the connection to the server
        } catch {
            status = .error("Something went wrong")
            return false
        }
        if username.lowercased() == "scott" && password.lowercased() == "tiger" {
            status = .connected(username)
            return true
        } else {
            status = .error("Invalid username or password")
            return false
        }
    }
    
    func logoutByInactivity() {
        status = .disconnectingByInactivity
    }
    
    func logout() {
        status = .disconnected
    }
}
