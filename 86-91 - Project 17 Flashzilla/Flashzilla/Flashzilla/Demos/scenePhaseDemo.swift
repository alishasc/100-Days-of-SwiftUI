//
//  scenePhaseDemo.swift
//  Flashzilla
//
//  Created by Alisha Carrington on 03/09/2025.
//

import SwiftUI

struct scenePhaseDemo: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    scenePhaseDemo()
}
