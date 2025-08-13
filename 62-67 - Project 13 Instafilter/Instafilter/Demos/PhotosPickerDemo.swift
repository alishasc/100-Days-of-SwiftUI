//
//  PhotosPickerDemo.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import PhotosUI
import SwiftUI

struct PhotosPickerDemo: View {
    // the selected image
    @State private var pickerItem: PhotosPickerItem?
    // to store the selected image as a SwiftUI Image
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
            
            selectedImage?
                .resizable()
                .scaledToFit()
        }
        .onChange(of: pickerItem) {
            // when pickerItem changes, it means the user has selected an image
            Task {
                // loadTransferable() tells SwiftUI to load data from the picker item into a SwiftUI Image
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

struct PhotosPickerDemo2: View {
    // select multiple images at once
    @State private var pickerItems = [PhotosPickerItem]()
    // store multiple selected images
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo.on.rectangle.angled.fill")
            }
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .onChange(of: pickerItems) {
            Task {
                // clear the array when new images are selected
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
//    PhotosPickerDemo()
    PhotosPickerDemo2()
}
