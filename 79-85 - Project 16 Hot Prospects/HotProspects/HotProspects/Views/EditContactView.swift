//
//  EditContactView.swift
//  HotProspects
//
//  Created by Alisha Carrington on 01/09/2025.
//

import SwiftUI

struct EditContactView: View {
    @Environment(\.modelContext) var modelContext  // to update data in db
    @Environment(\.dismiss) var dismiss
    
    var prospect: Prospect
    @State private var name: String
    @State private var emailAddress: String
    
    init(prospect: Prospect) {
        self.prospect = prospect
        self.name = prospect.name
        self.emailAddress = prospect.emailAddress
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Email Address", text: $emailAddress)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    // update info in db then dismiss
                    if prospect.name != name {
                        prospect.name = name
                    } else if prospect.emailAddress != emailAddress {
                        prospect.emailAddress = emailAddress
                    }
                    
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditContactView(prospect: .example)
}

