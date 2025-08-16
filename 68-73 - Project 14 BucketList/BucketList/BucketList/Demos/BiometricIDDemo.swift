//
//  BiometricIDDemo.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

import LocalAuthentication
import SwiftUI

struct BiometricIDDemo: View {
    // whether the app is showing its protected data or not. true when authentication succeeds
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        // lets us query biometric status and perform authentication check
        let context = LAContext()
        var error: NSError?
        
        // ask the context if it's capable of performing biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            // make actual request for authentication
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // run this closure when authentication completes
                if success {
                    // authenticated successfully
                    isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics. e.g. using iPod Touch
        }
    }
}

#Preview {
    BiometricIDDemo()
}
