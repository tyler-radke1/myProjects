//
//  ContentView.swift
//  Time Conversion
//
//  Created by Tyler Radke on 1/9/23.
//

import SwiftUI

struct ContentView: View {
   @State private var enteredNumber = 0
    @State private var convertFrom = Times.day
    @State private var convertTo = Times.hour
    
    enum Times: String, CaseIterable {
        
        case day = "Day"
        case hour = "Hour"
        case minute = "Minute"
        case second = "Second"
    }
    
    func doConversion(amount: Int, convertFrom: Times, convertTo: Times) -> Int {
        if convertFrom == Times.day {
            switch convertTo {
            case .day:
                return amount
            case .hour:
                return amount * 24
            case .minute:
                return amount * 1440
            case .second:
                return amount * 86400
            }
        }
        
        if convertFrom == Times.hour {
            switch convertTo {
            case .day:
                return amount / 24
            case .hour:
                return amount
            case .minute:
                return amount * 60
            case .second:
                return amount * 3600
            }
                
                
            }
        if convertFrom == Times.minute {
            switch convertTo {
            case .day:
                return amount / 1440
            case .hour:
                return amount / 60
            case .minute:
                return amount
            case .second:
                return amount * 60
            }
        }
            
        if convertFrom == Times.second {
            switch convertTo {
            case .day:
                return amount / 86440
            case .hour:
                return amount / 3600
            case .minute:
                return amount / 60
            case .second:
                return amount
            
            }
        }
        
            return 0
        }
    

    
        
    
    var body: some View {
        
        Form {
            
            //Enter time to convert
            Section {
                TextField("Amount", value: $enteredNumber, format: .number)
                    .keyboardType(.numberPad)
                
                Picker("Time Unit", selection: $convertFrom) {
                    ForEach(Times.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                    
                }
                
            } header: {
                Text("Input")
            }
            
            Section {
                Text(String(doConversion(amount: enteredNumber, convertFrom: convertFrom, convertTo: convertTo)))
                
                Picker("Time Unit", selection: $convertTo) {
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
