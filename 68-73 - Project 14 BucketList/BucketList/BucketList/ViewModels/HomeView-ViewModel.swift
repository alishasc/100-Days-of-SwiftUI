//
//  HomeView-ViewModel.swift
//  BucketList
//
//  Created by Alisha Carrington on 16/08/2025.
//

import CoreLocation
import Foundation
import LocalAuthentication
import MapKit

// extension - specifically the view model for HomeView
extension HomeView {
    @Observable
    class ViewModel {
        var isUnlocked = false  // if the app's unlocked
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        // says reading locations is fine, but only this class itself can write locations
        private(set) var locations: [Location]
        // to present a sheet with selected Location details
        var selectedPlace: Location?
        var standardMapStyle = true  // standard map style by default - trigger to switch to hybrid
        var showAlert = false
        
        init() {
            do {
                // try and load any existing data
                let data = try Data(contentsOf: savePath)
                // and decode it into the locations array
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            // create and save new instance of the tapped location
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            
            save()
        }
        
        func update(location: Location) {
            // check we have a selectedPlace to work with
            guard let selectedPlace else { return }
            
            // search for index in array of the original place selected to edit
            if let index = locations.firstIndex(of: selectedPlace) {
                // update the data based on the location info returned in 'onSave()'
                locations[index] = location
                
                save()
            }
        }
        
        func removeLocation(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations.remove(at: index)
                
                print("location removed")
                
                save()
            }
        }
        
        func save() {
            do {
                // try and convert data into raw JSON Data
                let data = try JSONEncoder().encode(locations)
                // saves the JSON data to the "SavedPlaces" file
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        // handles biometric authentication
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // this string is for users with touch ID
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                        self.showAlert = true
                    }
                }
            } else {
                // no biometrics on user's device
                self.showAlert = true
            }
        }
    }
}
