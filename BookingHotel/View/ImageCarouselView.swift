//
//  ImageCarouselView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI

struct ImageCarouselView: View {
    let images: [String] // Assuming these are URLs of the images

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { imageUrl in
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 343, height: 257)
                        .clipped()
                    
                      .cornerRadius(15)
                } placeholder: {
                    Color.gray
                }
            }
        }
        .background(Color.white)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(width: 343, height: 257)
    }
}
