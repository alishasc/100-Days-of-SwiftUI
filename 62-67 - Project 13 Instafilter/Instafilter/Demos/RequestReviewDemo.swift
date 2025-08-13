//
//  RequestReviewDemo.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import StoreKit
import SwiftUI

struct RequestReviewDemo: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    RequestReviewDemo()
}
