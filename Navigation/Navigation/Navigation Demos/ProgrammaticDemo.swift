//
//  ProgrammaticDemo.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

import SwiftUI

struct ProgrammaticDemo: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 30) {
                Button("Show 32") {
                    path = [32]
                    print(path)
                }
                
                Button("Show 64") {
                    path.append(64)
                    print(path)
                }
                
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticDemo()
}
