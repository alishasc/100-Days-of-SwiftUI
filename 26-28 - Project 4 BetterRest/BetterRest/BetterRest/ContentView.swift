//
//  ContentView.swift
//  BetterRest
//
//  Created by Alisha Carrington on 05/06/2025.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var sleepTime = Date.now
    // for alert
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // default time of 7am
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("When do you want to wake up?")) {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section(header: Text("Desired amount of sleep")) {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section(header: Text("Daily coffee intake")) {
                    Picker(selection: $coffeeAmount, label: Text("Number of cups")) {
                        ForEach(1...20, id: \.self) { number in
                            Text("^[\(number) cup](inflect: true)")
                        }
                    }
                }
                
                VStack {
                    Text("Your ideal bedtime is...")
                    Text(sleepTime.formatted(date: .omitted, time: .shortened))
                }
                .font(.title)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("BetterRest")
//            .toolbar {
//                // button added to navigation bar
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("OK") { }
//            } message: {
//                Text(alertMessage)
//            }
            .onChange(of: wakeUp) {
                calculateBedtime()
            }
            .onChange(of: sleepAmount) {
                calculateBedtime()
            }
            .onChange(of: coffeeAmount) {
                calculateBedtime()
            }
        }
    }
    
    // when press button
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            /* wakeUp is stored as Date not a Double
             get hour and minute values using dateComponents */
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            // convert the hour and minutes into seconds
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // prediction using the three features specified when training the model
            // prediction will be value in seconds - how much sleep they actually need
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            // convert prediction into actual time user should go to bed. work this out by subtracting the prediction seconds from the time they need to wake up
            // below returns result as a Date
            sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        // trigger alert
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
