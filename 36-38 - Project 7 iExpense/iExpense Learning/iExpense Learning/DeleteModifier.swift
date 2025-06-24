//
//  DeleteModifier.swift
//  iExpense Learning
//
//  Created by Alisha Carrington on 24/06/2025.
//

import SwiftUI

struct DeleteModifier: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    // swipe to delete rows
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                // delete multiple rows. Edit/Done button
                EditButton()
            }
        }
    }
    
    // IndexSet = set of integer indexes
    // positions of all the items in the ForEach that should be removed
    func removeRows(at offsets: IndexSet) {
        // atOffsets accepts an IndexSet
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    DeleteModifier()
}
