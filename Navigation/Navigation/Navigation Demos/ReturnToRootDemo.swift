//
//  ReturnToRootDemo.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

import SwiftUI

struct ReturnToRootDemo: View {
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView2(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView2(number: i)
                }
        }
    }
}

struct DetailView2: View {
    // @Binding var path: [Int]
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
//            .toolbar {
//                // press this to reset array and go back to root view
//                Button("Home") {
//                    path.removeAll()
//                }
//            }
    }
}

#Preview {
    ReturnToRootDemo()
}
