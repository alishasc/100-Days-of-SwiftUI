//
//  UserDefaultDemo.swift
//  iExpense Learning
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftUI

// VERSION 1 - UserDefaults
struct UserDefaultDemo: View {
    // read value back from UserDefaults
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Text("Version 1 - UserDefaults")
        Button("Tap count: \(tapCount)") {
            tapCount += 1
            // save the number of taps made
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

// VERSION 2 - @AppStorage
struct UserDefaultDemo2: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Text("Version 2 - @AppStorage")
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

// VERSION 2 - JSONEncoder and Codable protocol
struct UserDefaultDemo3: View {
    @State private var user = User2(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Text("Version 3 - JSONEncoder and Codable")
        Button("Save User") {
            let encoder = JSONEncoder()
            
            // try convert user data into JSON using encode()
            if let data = try? encoder.encode(user) {
                // access UserDefaults directly - @AppStorage won't work
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct User2: Codable {
    let firstName: String
    let lastName: String
}

#Preview {
    VStack(spacing: 40) {
        UserDefaultDemo()
        UserDefaultDemo2()
        UserDefaultDemo3()
    }
}

