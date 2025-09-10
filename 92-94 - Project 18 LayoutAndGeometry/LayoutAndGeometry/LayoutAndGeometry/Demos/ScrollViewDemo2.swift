//
//  ScrollViewDemo2.swift
//  LayoutAndGeometry
//
//  Created by Alisha Carrington on 10/09/2025.
//

import SwiftUI

struct ScrollViewDemo2: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    Text("Number \(num)")
                        .font(.largeTitle)
                        .padding()
                        .background(.red)
                        .frame(width: 200, height: 200)
                        .visualEffect { content, proxy in
                            content.rotation3DEffect(.degrees(-proxy.frame(in: .global).minX), axis: (x: 0, y: 1, z: 0))
                        }
                }
            }
            // tells SwiftUI the Text views should be treated as individual scroll targets / potential 'snap point'
            .scrollTargetLayout()
        }
        // scroll view will automatically snap to align with views marked by scrollTargetLayout()
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ScrollViewDemo2()
}
