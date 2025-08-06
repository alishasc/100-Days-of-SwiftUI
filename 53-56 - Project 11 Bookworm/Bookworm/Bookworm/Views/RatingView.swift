//
//  RatingView.swift
//  Bookworm
//
//  Created by Alisha Carrington on 04/08/2025.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number  // @Binding
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)  // stops you from pressing whole row on AddBookView()
    }
    
    func image(for number: Int) -> Image {
        // return the offImage if the number is greater than the rating given
        if number > rating {
            offImage ?? onImage
        } else  {
            // if equal to or lower than rating, return onImage
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
