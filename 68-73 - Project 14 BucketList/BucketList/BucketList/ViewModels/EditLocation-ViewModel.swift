//
//  EditLocation-ViewModel.swift
//  BucketList
//
//  Created by Alisha Carrington on 16/08/2025.
//

import Foundation

extension EditLocationView {
    @Observable
    class ViewModel {
        var location: Location
        var name: String
        var description: String
        var loadingState = LoadingState.loading
        // store array of Wikipedia pages once the fetch has completed
        var pages = [Page]()
        
        init(location: Location) {
            self.location = location
            self.name = location.name
            self.description = location.description
        }
        
        enum LoadingState {
            case loading, loaded, failed
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            // check URL is valid
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                // try and fetch data from the given URL
                let (data, _) = try await URLSession.shared.data(from: url)
                // decode the returned data
                let items = try JSONDecoder().decode(Result.self, from: data)
                
                // save the retrieved data into our pages array in order of page title
                // .query.pages = hierarchy of the Result model
                pages = items.query.pages.values.sorted()

                // update the view state - successful :)
                loadingState = .loaded
            } catch {
                // update the view state - unsuccessful :(
                loadingState = .failed
            }
        }
        
        func saveNewDetails() -> Location {
            // create a new location with the modified details
            var newLocation = location
            
            // Swift thinks two places are identical if they have the same ID, so need to create a new ID when changing the details of an existing location, otherwise Swift won't bother to change the map
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            return newLocation
        }
    }
}
