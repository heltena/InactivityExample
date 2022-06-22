//
//  ContentView.swift
//  InactivityExample
//
//  Created by Heliodoro Tejedor Navarro on 6/22/22.
//

import Inactivity
import SwiftUI

struct ContentView: View {
    var body: some View {
        InactivityWatcherView { proxy in
            InactiveView() {
                proxy.becomeActive(timeout: 5)
            }
            ActiveView() {
                proxy.becomeInactive()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
