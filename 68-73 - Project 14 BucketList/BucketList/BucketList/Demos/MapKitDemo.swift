//
//  MapKitDemo.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

import MapKit
import SwiftUI

struct Location2: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapKitDemo: View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            // coords of London
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            // span of 1 degree by 1 degree
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    let locations = [
        Location2(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location2(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
//        Map(interactionModes: [])
//            .mapStyle(.hybrid(elevation: .realistic))
        
        // map centered on London via position binding
//        VStack {
//            Map(position: $position)
//                // tells us when the position changes. continuous - post updates continuously
//                // remove continuous to only give the position when the user's stopped moving
//                .onMapCameraChange(frequency: .continuous) { context in
//                    print(context.region)
//                }
//        }
//        
//        HStack(spacing: 50) {
//            Button("Paris") {
//                position = MapCameraPosition.region(
//                    MKCoordinateRegion(
//                        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
//                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//                    )
//                )
//            }
//            
//            Button("Tokyo") {
//                position = MapCameraPosition.region(
//                    MKCoordinateRegion(
//                        center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
//                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//                    )
//                )
//            }
//        }
        
//        Map {
//            ForEach(locations) { location in
////                Marker(location.name, coordinate: location.coordinate)
//
//                Annotation(location.name, coordinate: location.coordinate) {
//                    Text(location.name)
//                        .font(.headline)
//                        .padding()
//                        .background(.blue)
//                        .foregroundStyle(.white)
//                        .clipShape(.capsule)
//                }
//                .annotationTitles(.hidden)  // hide default location name
//            }
//        }
        
        // get actual coordinates of where a user taps on the Map
        MapReader { proxy in
            Map()
                // convert screen location of tap to map coordinates
                .onTapGesture { position in
                    // .local - the tap location is relative to the top-left corner of the map rather than the whole screen
                    if let coordinate = proxy.convert(position, from: .local) {
                        print(coordinate)
                    }
                }
        }
    }
}

#Preview {
    MapKitDemo()
}
