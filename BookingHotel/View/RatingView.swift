//
//  RatingView.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import SwiftUI

struct RatingView: View {
    var rating: Int
    var ratingText: String
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow)
                .frame(width: 15, height: 15)
            
            Text("5 Превосходно")
                .font(
                Font.custom("SF Pro Display", size: 16)
                .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.2))
        .cornerRadius(5)// Опционально, для добавления тени под блоком
    }
}
