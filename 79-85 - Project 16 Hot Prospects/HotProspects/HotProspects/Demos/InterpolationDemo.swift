//
//  InterpolationDemo.swift
//  HotProspects
//
//  Created by Alisha Carrington on 25/08/2025.
//

import SwiftUI

struct InterpolationDemo: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    InterpolationDemo()
}
