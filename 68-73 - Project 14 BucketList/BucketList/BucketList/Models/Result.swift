//
//  Result.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    // sort pages alphabetically by title
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
    /* MARK: the func is why we can write
        pages = items.query.pages.values.sorted()
     instead of
        pages = items.query.pages.values.sorted { $0.title < $1.title }
     */
    
    // return the description from Wikipedia if it exists inside the terms array returned
    var description: String {
        terms?["description"]?.first?.capitalisingFirstLetter() ?? "No further information"
    }
}

// capitalise the descriptions returned from Wiki
extension String {
    func capitalisingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitaliseFirstLetter() {
        self = self.capitalisingFirstLetter()
    }
}
