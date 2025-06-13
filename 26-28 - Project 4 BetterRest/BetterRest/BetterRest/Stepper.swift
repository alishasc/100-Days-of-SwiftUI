//
//  Stepper.swift
//  BetterRest
//
//  Created by Alisha Carrington on 05/06/2025.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
//        Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
        
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    StepperView()
}
