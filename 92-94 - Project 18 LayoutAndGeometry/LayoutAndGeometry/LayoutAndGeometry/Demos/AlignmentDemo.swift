//
//  AlignmentDemo.swift
//  LayoutAndGeometry
//
//  Created by Alisha Carrington on 09/09/2025.
//

import SwiftUI

struct AlignmentDemo: View {
    var body: some View {
        Text("Live long and prosper")
            .frame(width: 300, height: 100, alignment: .topLeading)
            .offset(x: 20, y: 50)
            .background(.yellow)
        
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
        }
        .padding(.bottom, 20)
        
//        VStack(alignment: .leading) {
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in d[.trailing] }
//            Text("This is a longer line of text")
//        }
//        .background(.red)
//        .frame(width: 400, height: 400)
//        .background(.blue)
        
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in Double(position) * -10 }
            }
        }
        .padding()
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    AlignmentDemo()
}
