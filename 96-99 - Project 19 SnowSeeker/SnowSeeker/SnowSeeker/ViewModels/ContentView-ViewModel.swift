//
//  ContentView-ViewModel.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 18/09/2025.
//

import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        // load all resorts from json
        let resorts: [Resort] = Bundle.main.decode("resorts.json")
    }
}
