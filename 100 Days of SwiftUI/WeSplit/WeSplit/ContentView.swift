//
//  ContentView.swift
//  WeSplit
//
//  Created by Tyler Radke on 1/9/23.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var isFocused: Bool
    
    let tipPercentages = [0,10,15,20,25,50]
   
    var totalPerPerson: Double {
        let people = Double(numberOfPeople + 2)
        let tip = (checkAmount / 100) * Double(tipPercentage)
    
        return (checkAmount + tip) / people
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                        
                    
                    
                    Picker("How many people?", selection: $numberOfPeople,  content: {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                        
                    })
                }
                
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage, content: {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    })
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip to leave")
                }
            
                
                
                
                Section {
                    
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }  header: {
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
