//
//  DatePicker.swift
//  BetterRest
//
//  Created by Alisha Carrington on 05/06/2025.
//

import SwiftUI

struct DatePickerView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            .labelsHidden()
    }
    
    func exampleDates() {
        // create second Date set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)
        
        // create range from the two Dates
        let range = Date.now...tomorrow
    }
}

#Preview {
    DatePickerView()
}
