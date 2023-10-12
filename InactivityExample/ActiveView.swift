//
//  ActiveView.swift
//  InactivityExample
//
//  Created by Heliodoro Tejedor Navarro on 6/22/22.
//

import Inactivity
import SwiftUI

struct ActiveView: View {
    var becomeInactive: () -> Void
    @State var firstOperand: String = ""
    @State var secondOperand: String = ""
    @State var resultOperand: String?
    
    func addValues() {
        guard
            let firstOperand = Int(firstOperand),
            let secondOperand = Int(secondOperand)
        else {
            resultOperand = nil
            return
        }
        resultOperand = "\(firstOperand + secondOperand)"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Operand", text: $firstOperand)
                    TextField("Operand", text: $secondOperand)
                    Button {
                        addValues()
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
                Section {
                    if let resultOperand = resultOperand {
                        Text(resultOperand)
                    } else {
                        Text("Not valid")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .formStyle(.grouped)
            .navigationTitle("You are active!")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        becomeInactive()
                    } label: {
                        Text("Close")
                    }
                }
            }
        }
    }
}

struct ActiveView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveView() { }
    }
}
