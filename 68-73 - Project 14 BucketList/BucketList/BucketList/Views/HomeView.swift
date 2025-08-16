//
//  HomeView.swift
//  BucketList
//
//  Created by Alisha Carrington on 15/08/2025.
//

import MapKit
import SwiftUI

struct HomeView: View {
    @State private var viewModel = ViewModel()
    
    @State private var pressedDelete = false
    
    // starting map position showing the UK
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 54, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        // show map view if app's unlocked
        if viewModel.isUnlocked {
            ZStack {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture(minimumDuration: 0.1) {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .mapStyle(viewModel.standardMapStyle ? MapStyle.standard : MapStyle.hybrid)
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditLocationView(location: place) { locationToUpdate in
                            // what to do 'onSave'
                            viewModel.update(location: locationToUpdate)
                        } onDelete: { locationToDelete in
                            // to do 'onDelete'
                            viewModel.removeLocation(location: locationToDelete)
                        }
                    }
                    .onTapGesture { position in
                        // convert screen position to geo coordinates
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    
                    // switch between map styles
                    Button(viewModel.standardMapStyle ? "Hybrid View" : "Standard View") {
                        viewModel.standardMapStyle.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .alert("Sorry something's gone wrong.", isPresented: $viewModel.showAlert) {
                Button("Try again") { viewModel.authenticate() }
                Button("Cancel", role: .cancel) { }
            }
        } else {
            // unlock app button
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    HomeView()
}

