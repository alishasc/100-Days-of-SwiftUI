//
//  GeometryReaderDemo.swift
//  LayoutAndGeometry
//
//  Created by Alisha Carrington on 10/09/2025.
//

import SwiftUI

struct GeometryReaderDemo: View {
    var body: some View {
//        GeometryReader { proxy in
//            Image(.pic)
//                .resizable()
//                .scaledToFit()
//                // width to fill 80% of screen
//                .frame(width: proxy.size.width * 0.8)
//        }
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image(.pic)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)  // size of image
                    .frame(width: proxy.size.width, height: proxy.size.height)  // second frame centers image
            }
        }
    }
}

#Preview {
    GeometryReaderDemo()
}
