//
//  OptionalAlertSheetDemo.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 16/09/2025.
//

import SwiftUI

struct OptionalAlertSheetDemo: View {
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
        }
        // sheet is displayed when selectedUser is given a value
        // selectedUser is set back to nil when the sheet's dismissed
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large])
        }
    }
}

struct OptionalAlert: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me") {
            isShowingUser = true
        }
        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
            Button(user.id) { }
        }
    }
}

struct User: Identifiable {
    var id = "Taylor Swift"
}

#Preview {
    OptionalAlertSheetDemo()
}

#Preview {
    OptionalAlert()
}
