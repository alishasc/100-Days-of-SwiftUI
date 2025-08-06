//
//  Expenses.swift
//  iExpense
//
//  Created by Alisha Carrington on 24/06/2025.
//

// class to store an array of all expenses

import Foundation
import SwiftUI

@Observable  // updates UI
class Expenses {
//    init() {
//        // attempt to read Items key from UserDefaults
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            // create instance of JSONDecoder to convert data from JSON into array of ExpenseItem objects
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                // assign the array to 'items' and exit
//                items = decodedItems
//                
//                // sort into separate arrays
//                for item in items {
//                    if item.type == "Personal" {
//                        personalItems.append(item)
//                    } else {
//                        businessItems.append(item)
//                    }
//                }
//                
//                return
//            }
//        }
//        
//        // if not, set 'items' to be an empty array
//        items = []
//    }
    
    // store all expense item structs created
    var items = [ExpenseItem]()
//    {
//        // whenever an item is added/removed it'll write out changes
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
    
    // elements added in init()
    var personalItems = [ExpenseItem]()
    var businessItems = [ExpenseItem]()
    
    func removeItems(at offsets: IndexSet) {
        // remove elements from items array from the class
        items.remove(atOffsets: offsets)
    }
    
    func backgroundColor(amount: Double) -> Color {
        if amount <= 10 {
            return .green
        } else if amount <= 100 {
            return .orange
        } else {
            return .red
        }
    }
}
