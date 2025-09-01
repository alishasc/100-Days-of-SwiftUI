//
//  MeView.swift
//  HotProspects
//
//  Created by Alisha Carrington on 26/08/2025.
//

// QR code for user

import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    // textfields info
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    @State private var qrCode = UIImage()
    
    // for CoreImage code
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                // will regenerate image everytime the name/email change
                Image(uiImage: generateQRCode(from: "\(name)\n\(emailAddress)"))
                    .interpolation(.none)  // remove pixel smoothing effect
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        ShareLink(item: Image(uiImage: qrCode), preview: SharePreview("My QR Code", image: Image(uiImage: qrCode)))
                    }
            }
            .navigationTitle("Your code")
            .onAppear(perform: updateCode)
            .onChange(of: name, updateCode)
            .onChange(of: emailAddress, updateCode)
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        // convert the input String into Data
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            // convert CIImage into a CGImage
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                // convert CGImage into a UIImage
                return UIImage(cgImage: cgImage)
            }
        }
        
        // if fails...
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    // called when the view is shown and when the name/email changes
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
}

#Preview {
    MeView()
}

