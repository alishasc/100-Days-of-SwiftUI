//
//  SwitchingViewStateDemo.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

import SwiftUI

enum LoadingState2 {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct SwitchingViewStateDemo: View {
    // track current app state and show relevant child view
    @State private var loadingState = LoadingState2.loading
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

#Preview {
    SwitchingViewStateDemo()
}
