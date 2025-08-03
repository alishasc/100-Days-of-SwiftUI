//
//  Order.swift
//  CupcakeCorner
//
//  Created by Alisha Carrington on 30/07/2025.
//

import SwiftUI

@Observable
class Order: Codable {
    init() {
        // decode any saved address
        if let savedAddress = UserDefaults.standard.data(forKey: "Address") {
            if let decodedAddress = try? JSONDecoder().decode(Address.self, from: savedAddress) {
                address = decodedAddress
                return
            }
        }
        
        // if no saved data, set var to new instance of Address - empty fields
        address = Address()
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
    }
    
    // ContentView info
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    var type = 0  // 0 -> Vanilla
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            // reset options to false if user doesn't have special request anymore
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    // AddressView info
    var address = Address() {
        // save entered Address - will be there when reopen the app
        didSet {
            if let encoded = try? JSONEncoder().encode(address) {
                UserDefaults.standard.set(encoded, forKey: "Address")
            }
        }
    }
    
    // address textfields validation - ensure fields are filled and not only whitespace
    var hasValidAddress: Bool {
        let address = [address.name, address.streetAddress, address.city, address.zip]
        
        for word in address {
            if word.trimmingCharacters(in: .whitespaces).isEmpty {
                // string contains non-whitespace characters
                return false
            }
        }
        
        return true
    }
    
    // CheckoutView info
    var cost: Decimal {
        // £2 per cake
        var cost = Decimal(quantity) * 2
        // complicated cakes cost more
        cost += Decimal(type) / 2
        // £1 for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        // 50p for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
    
    var alertTitle = ""
    var alertMessage = ""
    var showingAlert = false
    var errorOccurred = false  // determines which alert title is shown
}
