//
//  FormDisabledDemo.swift
//  CupcakeCorner
//
//  Created by Alisha Carrington on 30/07/2025.
//

import SwiftUI

struct FormDisabledDemo: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating account...")
                }
            }
            // disable whole section
//            .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
}

#Preview {
    FormDisabledDemo()
}
