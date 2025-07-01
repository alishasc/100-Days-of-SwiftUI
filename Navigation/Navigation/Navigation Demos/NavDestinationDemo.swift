//
//  NavDestinationDemo.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

import SwiftUI

struct NavDestinationDemo: View {
    let str = ["hello", "world"]
    
    var body: some View {
        NavigationStack {
//            List(0..<100) { i in
//                NavigationLink("Select \(i)", value: i)
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected \(selection)")
//            }
            
            List(str, id: \.self) { string in
                NavigationLink("\(string)", value: string)
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    NavDestinationDemo()
}
