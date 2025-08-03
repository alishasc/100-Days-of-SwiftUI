//
//  AsyncImageDemo.swift
//  CupcakeCorner
//
//  Created by Alisha Carrington on 30/07/2025.
//

import SwiftUI

struct AsyncImageDemo: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.red
        }
        .frame(width: 200, height: 200)
        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png"), scale: 3) { phase in
            if let image = phase.image {
                // show image like normal
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                // error occured - show error message instead
                Text("There was an error loading the image.")
            } else {
                // still loading image
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    AsyncImageDemo()
}
