//
//  CustomAlignmentGuide.swift
//  LayoutAndGeometry
//
//  Created by Alisha Carrington on 09/09/2025.
//

// makes the account and name use their center position for the alignmentGuide()
// both views are aligned so their centers are both on the .midAccountAndName guide

import SwiftUI

struct CustomAlignmentGuide: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@alisha")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]}
                Image(.pic)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("ALISHA C")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]}
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    CustomAlignmentGuide()
}

extension VerticalAlignment {
    // use enum so it's clear that this only exists to house functionality
    enum MidAccountAndName: AlignmentID {
        // accepts ViewDimensions object and returns a CGFloat specifying how a view should be aligned if it doesn't have an alignmentGuide() modifier
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]  // default dimension to use
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
