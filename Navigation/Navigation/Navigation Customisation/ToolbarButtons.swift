//
//  ToolbarButtons.swift
//  Navigation
//
//  Created by Alisha Carrington on 01/07/2025.
//

import SwiftUI

struct ToolbarButtons: View {
    var body: some View {
        NavigationStack {
            Text("Hello world!")
//                .toolbar {
//                    ToolbarItem(placement: .cancellationAction) {
//                        Button("Tap Me") {
//                            //
//                        }
//                    }
//                    
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Or Tap Me") {
//                            //
//                        }
//                    }
//                }
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            //
                        }
                        
                        Button("Tap Me 2") {
                            //
                        }
                    }
                }
        }
    }
}

#Preview {
    ToolbarButtons()
}
