//
//  TimerDemo.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 03/09/2025.
//

import SwiftUI

struct TimerDemo: View {
    // create a timer publisher
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var currentTime = Date()
    
    var body: some View {
        Text("Hello, World!")
            // accepts the timer publisher as its parameter and a function to run
            .onReceive(timer) { time in
                if counter == 5 {
                    // cancel the timer after 5 iterations
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                    currentTime = time
                }
                
                counter += 1
            }
        
        Text("\(currentTime)")
    }
}

#Preview {
    TimerDemo()
}
