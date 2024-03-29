//
//  InactiveView.swift
//  InactivityExample
//
//  Created by Heliodoro Tejedor Navarro on 6/22/22.
//

import Inactivity
import SwiftUI

struct InactiveView: View {
    var becomeActive: () -> Void
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                Image(systemName: "globe.asia.australia")
                    .foregroundColor(Color.accentColor)
                    .font(.largeTitle)
                Text("Push the button to start...")
                Spacer()
            }
            .navigationTitle("Your are inactive")
            .toolbar {
                ToolbarItem {
                    Button {
                        becomeActive()
                    } label: {
                        Text("Start")
                    }
                }
            }
        }
        .onAppear {
            print("Appear")
        }
        .onDisappear {
            print("Disappear")
        }
    }
}

struct InactiveView_Previews: PreviewProvider {
    static var previews: some View {
        InactiveView() { }
    }
}
