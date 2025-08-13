//
//  CoreImageDemo.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageDemo: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage2)
    }
    
    // load image and apply sepia filter
    func loadImage() {
        // load image as a UIImage
        let inputImage = UIImage(resource: .fallGuy)
        // convert the UIImage into a CIImage - what Core Image works with
        let beginImage = CIImage(image: inputImage)
        
        // create the context and the filter we want to use
        let context = CIContext()
        
        // MARK: sepia filter
//        let currentFilter = CIFilter.sepiaTone()
        // intensity is how strong the sepia filter should be (0-1)
//        currentFilter.intensity = 1
        
        // MARK: pixellation filter
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.scale = 5
        
        // MARK: crystal effect
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.radius = 20
        
        // MARK: twirl distortion effect
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.radius = 700
        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        // inputImage is the image we want to apply the filter to
        currentFilter.inputImage = beginImage
        
        // attempt to get a CIImage from our filter - returns optional
        guard let outputImage = currentFilter.outputImage else { return }
        
        // attempt to get a CGImage from the CIImage - returns options as well
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        // convert the CGImage to a UIImage
        let uiImage = UIImage(cgImage: cgImage)
        
        // convert the UIImage to a SwiftUI Image - this will show in the UI!
        image = Image(uiImage: uiImage)
    }
    
    func loadImage2() {
        let inputImage = UIImage(resource: .fallGuy)
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        
        // chosen filter
        let currentFilter = CIFilter.pixellate()
        currentFilter.inputImage = beginImage
        
        let amount = 1.0
        
        // by including this, you can change the twirl distortion to any other filter and the code will still work
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    CoreImageDemo()
}
