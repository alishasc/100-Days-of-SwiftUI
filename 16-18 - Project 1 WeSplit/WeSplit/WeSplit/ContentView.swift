//
//  ContentView.swift
//  WeSplit
//
//  Created by Alisha Carrington on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalBill: Double {
        return checkAmount + (checkAmount / 100 * Double(tipPercentage))
    }
    var totalPerPerson: Double {
        // add 2 as people Picker has range 2 - 100 but it counts from 0
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        // work out what each person pays
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal / peopleCount
    }
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                // input total cost and choose the number of people to split bill
                Section {
                    // treats Double input as a currency
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                        .keyboardType(.decimalPad)
                        // when the TextField is being used, amountIsFocused is true
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                // choose a tip percentage
                Section("How much do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        // loops the array and formats as percent to add %
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
                        
                        // pick tip between 0 and 100
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    // segmented = shows handful of options in horizontal list - good for small selection
//                    .pickerStyle(.segmented)
                    // navigationLink opens a new view to select number of people - need NavigationStack for the new view to open
                    .pickerStyle(.navigationLink)
                }
                
                Section("Total bill") {
                    Text(totalBill, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                        // change text to red if 0% tip selected
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
                
                // display total amount
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                }
            }
            .navigationTitle("WeSplit")
            // adds button to navigation bar at top
            .toolbar {
                // only shows Button when the TextField is active
                if amountIsFocused {
                    Button("Done") {
                        // when false the on screen keyboard is dismissed
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
