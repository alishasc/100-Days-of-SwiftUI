//
//  ShareLinkDemo.swift
//  Instafilter
//
//  Created by Alisha Carrington on 12/08/2025.
//

import SwiftUI

struct ShareLinkDemo: View {
    var body: some View {
        // basic ShareLink
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        
        // ShareLink with subject and message
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
        
        // customised button
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        
        // ShareLink with a preview - important when sharing something more complex
        let image = Image(.fallGuy)
        ShareLink(item: image, preview: SharePreview("The Fall Guy", image: image)) {
            Label("Click to share", systemImage: "film")
        }
    }
}

#Preview {
    ShareLinkDemo()
}

