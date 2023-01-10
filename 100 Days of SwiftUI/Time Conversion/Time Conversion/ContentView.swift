//
//  ContentView.swift
//  Time Conversion
//
//  Created by Tyler Radke on 1/9/23.
//

import SwiftUI

struct ContentView: View {
   @State private var enteredNumber = 0
    @State private var selectedTime = Times.day
    
    enum Times: String, CaseIterable {
        
        case day = "Day"
        case hour = "Hour"
        case minute = "Minute"
        case second = "Second"
    }
    
    
    var body: some View {
        
        Form {
            
            //Enter time to convert
            Section {
                TextField("Amount", value: $enteredNumber, format: .number)
                    .keyboardType(.numberPad)
                
                
                Picker("Time Unit", selection: $selectedTime) {
                    ForEach(Times.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                    
                }
                
                
            } header: {
                Text("Input")
            }
            
            Section {
                Text("Text to be entered later")
                
                Picker("Time Unit", selection: $selectedTime) {
                    ForEach(Times.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                    
                }
            } header: {
                Text("Output")
            }
            
      
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
