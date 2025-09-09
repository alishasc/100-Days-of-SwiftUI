//
//  AbsolutePositioningDemo.swift
//  LayoutAndGeometry
//
//  Created by Alisha Carrington on 09/09/2025.
//

import SwiftUI

struct AbsolutePositioningDemo: View {
    var body: some View {
        Text("Hello, World!")
//            .position(x: 100, y: 100)  // absolute positioning
            .offset(x: 100, y: 100)
            .background(.yellow)
    }
}

#Preview {
    AbsolutePositioningDemo()
}
