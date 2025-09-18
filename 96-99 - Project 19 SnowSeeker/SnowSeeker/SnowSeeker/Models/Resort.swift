//
//  Resort.swift
//  SnowSeeker
//
//  Created by Alisha Carrington on 18/09/2025.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    // decode json file using Bundle extension
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
    
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    var sizeStr: String {
        // convert resort size Int value to String
        switch size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }
    var priceStr: String {
        // resort price is Int 1 to 3 - convert to dollar signs
        String(repeating: "$", count: price)
    }
}
