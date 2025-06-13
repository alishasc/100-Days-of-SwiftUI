//
//  ContentView.swift
//  UnitConversion
//
//  Created by Alisha Carrington on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    let units = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var convertFrom: String = "Seconds"
    @State private var convertTo: String = "Seconds"
    @State private var input: Int = 0
    @FocusState private var inputIsFocused: Bool
    
    var convert: Int {
        var seconds: Int = 0
        var result = 0
        // convert everything to seconds
        switch convertFrom {
        case "Minutes":
            seconds = input * 60
        case "Hours":
            seconds = input * 3600
        case "Days":
            seconds = input * 86400
        default:
            seconds = input
        }
        
        // convert from seconds to other units and return final value
        switch convertTo {
        case "Minutes":
            result = seconds / 60
        case "Hours":
            result = seconds / 3600
        case "Days":
            result = seconds / 86400
        default:
            result = seconds
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            Form { 
                Section("Convert from") {
                    Picker("Select a unit", selection: $convertFrom) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To") {
                    Picker("Select a unit", selection: $convertTo) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // user input
                Section("Enter number") {
                    TextField("Enter number", value: $input, format: .number)
                        .keyboardType(.numberPad)
                        .focused($inputIsFocused)
                }
                
                // final conversion result
                Section("Result") {
                    Text(convert, format: .number)
                }
            }
            .navigationTitle("Time Conversion")
            .toolbar {
                if inputIsFocused {
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
