//
//  ContentView-ViewModel.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 18/09/2025.
//

import Foundation

class ViewModel: ObservableObject {
    // load all resorts from json
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @Published var searchText = ""  // for use with searchable()
    @Published var sortBy: SortByOption = .original  // toolbar menu options
    
    enum SortByOption: CaseIterable {
        case original, name, country
        
        var label: String {
            switch self {
            case .original: "Default"
            case .name: "Name"
            case .country: "Country"
            }
        }
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            switch sortBy {
            case .original:
                // original list as downloaded from json
                resorts
            case .name:
                // sort alphabetically by resort
                resorts.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending }
            case .country:
                // sort alphabetically by country
                resorts.sorted { $0.country.localizedCaseInsensitiveCompare($1.country) == .orderedAscending }
            }
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    // ResortView
    @Published var selectedFacility: Facility?
    @Published var showingFacility = false
}
