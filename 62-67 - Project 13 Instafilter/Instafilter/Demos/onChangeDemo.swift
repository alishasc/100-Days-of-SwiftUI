//
//  onChangeDemo.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import SwiftUI

struct onChangeDemo: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
        }
        .padding()
    }
}

#Preview {
    onChangeDemo()
}
