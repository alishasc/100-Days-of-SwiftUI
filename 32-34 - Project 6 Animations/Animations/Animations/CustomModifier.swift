//
//  CustomModifier.swift
//  Animations
//
//  Created by Alisha Carrington on 20/06/2025.
//

import SwiftUI

struct CustomModifier: ViewModifier {
    let amount: Double  // how much rotation should happen
    let anchor: UnitPoint  // where rotation should take place
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()  // when the view rotates, parts outside the view aren't drawn
    }
}

extension AnyTransition {
    // name of transition = pivot
    static var pivot: AnyTransition {
        // rotate from -90 to 0 on its top leading corner
        .modifier(
            active: CustomModifier(amount: -90, anchor: .topLeading),
            identity: CustomModifier(amount: 0, anchor: .topLeading)
        )
    }
}

//#Preview {
//    CustomModifier()
//}
