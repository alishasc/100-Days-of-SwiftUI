//
//  ContentView.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    // image selection
    @State private var selectedItem: PhotosPickerItem?  // image selected by user
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var intensityFilterValid = false
    @State private var filterRadius = 0.5
    @State private var radiusFilterValid = false
    @State private var filterScale = 0.5
    @State private var scaleFilterValid = false
    
    // image filter
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()  // renders image from CIImage to CGImage
    // confirmationDialog()
    @State private var showingFilters = false
    // App Store review
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // image area
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        // redo the image filtering when the intensity value is changed
                        .onChange(of: filterIntensity, applyProcessing)
                        .disabled(intensityFilterValid == false)
                }
                .padding(.vertical)
                
                HStack {
                    Text("Radius")
                    Slider(value: $filterRadius)
                        .onChange(of: filterRadius, applyProcessing)
                        .disabled(radiusFilterValid == false)
                }
                
                HStack {
                    Text("Scale")
                    Slider(value: $filterScale)
                        .onChange(of: filterScale, applyProcessing)
                        .disabled(scaleFilterValid == false)
                }
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                        .disabled((processedImage == nil))
                    
                    Spacer()
                    
                    // share the picture - only if there's an image to share
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
            }
        }
        .padding([.horizontal, .bottom])
        .navigationTitle("Instafilter")
        // show a selection of filters
        .confirmationDialog("Select a filter", isPresented: $showingFilters) {
            Button("Crystallize") { setFilter(CIFilter.crystallize()) }
            Button("Edges") { setFilter(CIFilter.edges()) }
            Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
            Button("Pixellate") { setFilter(CIFilter.pixellate()) }
            Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
            Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
            Button("Vignette") { setFilter(CIFilter.vignette()) }
            Button("Kaleidoscope") { setFilter(CIFilter.kaleidoscope()) }
            Button("Invert") { setFilter(CIFilter.colorInvert()) }
            Button("Dot Screen") { setFilter(CIFilter.dotScreen()) }
            Button("Cancel", role: .cancel) { }
        }
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        // triggers image loading everytime the filter is changed
        intensityFilterValid = false
        radiusFilterValid = false
        scaleFilterValid = false
        
        currentFilter = filter
        loadImage()
        
        filterCount += 1
        if filterCount == 5 {
            // this needs to be done on Swift's main actor
            requestReview()
        }
    }
    
    func loadImage() {
        Task {
            // load user's selected image as a Data object
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            // convert the loaded image into a UIImage
            guard let inputImage = UIImage(data: imageData) else { return }
                        
            // convert the UIImage to a CIImage so can use Core Image
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            // apply filter whenever a new image is loaded
            applyProcessing()
        }
    }
    
    // apply filter to selected image
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        // only sets the intensity key if it's supported by the chosen filter etc
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
            intensityFilterValid = true
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
            radiusFilterValid = true
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
            scaleFilterValid = true
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        // convert CGImage to UIImage to SwiftUI Image
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    func changeFilter() {
        // trigger confirmationDialog
        showingFilters = true
    }
}

#Preview {
    ContentView()
}
