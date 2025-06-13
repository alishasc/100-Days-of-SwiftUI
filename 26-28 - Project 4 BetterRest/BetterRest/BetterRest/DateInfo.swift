//
//  DateInfo.swift
//  BetterRest
//
//  Created by Alisha Carrington on 05/06/2025.
//

import SwiftUI

struct DateInfo: View {
    var body: some View {
        // different types of formatting
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    
    // write specific parts of a date
    func dates() {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
    }
    
    // read specific parts of a date - will return as optionals
    func dates2() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

#Preview {
    DateInfo()
}
