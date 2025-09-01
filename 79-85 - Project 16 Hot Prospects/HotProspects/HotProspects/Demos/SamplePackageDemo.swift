//
//  SamplePackageDemo.swift
//  HotProspects
//
//  Created by Alisha Carrington on 25/08/2025.
//

import SamplePackage
import SwiftUI

struct SamplePackageDemo: View {
    let possibleNumbers = 1...60
    // results picks 7 numbers from possibleNumbers and makes them a single String
    var results: String {
        // using random() method from the SamplePackage framework - accepts integer and returns that number of random elements
        let selected = possibleNumbers.random(7).sorted()
        // use map() to convert an array of one type into an array of another type
        let strings = selected.map(String.init)
        // strings is an array of strings - join them together into a single string using formatted()
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    SamplePackageDemo()
}
