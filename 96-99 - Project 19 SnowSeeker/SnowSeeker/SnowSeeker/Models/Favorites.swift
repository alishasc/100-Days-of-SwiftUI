//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 19/09/2025.
//

import SwiftUI

@Observable
class Favorites {
    // resorts the user has favorited
    private var resorts: Set<String>
    // key used to read/write in UserDefaults
    private let key = "Favorites"
    
    init() {
        // load saved data
        if let data = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = decoded
                return
            }
        }
        
        // use empty set if there's nothing saved
        resorts = []
    }
    
    // returns true if Set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    // adds the resort to the Set and saves changes
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    // removes the resort from the Set and saves changes
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // write data to UserDefaults
        if let encoded = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
