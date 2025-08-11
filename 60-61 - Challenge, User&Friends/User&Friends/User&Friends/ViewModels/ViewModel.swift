//
//  ViewModel.swift
//  User&Friends
//
//  Created by Alisha Carrington on 09/08/2025.
//

import Foundation

@Observable
class ViewModel {
    var users: [User] = []
    
    func fetchData() async {
        users.removeAll()
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Invalid URL")
        }
        
        do {
            // make network request
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601  // to decode the registered date
                        
            // decode the fetched data into a string of User objects
            let decodedData = try decoder.decode([User].self, from: data)
            // update array with the decoded data
            users = decodedData
        } catch {
            print("Error downloading data: \(String(describing: error))")
        }
    }
}
