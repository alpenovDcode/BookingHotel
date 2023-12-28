//
//  BookingDetailView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import Foundation
import SwiftUI

struct BookingDetailView: View {
    @EnvironmentObject var bookingDetailViewModel: BookingDetailViewModel
    var bookingData: BookingData
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 16) {
                // Assuming RatingView is a custom view that shows the stars and rating text
                RatingView(rating: bookingData.hotelRating, ratingText: bookingData.ratingName)
                    .frame(width: 343, alignment: .leading)
                VStack {
                    Text(bookingData.hotelName)
                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                        .padding(.bottom, 1)
                }
                .frame(width: 343, alignment: .topLeading)
                
                Text(bookingData.hotelAddress)
                    .font(Font.custom("SF Pro Display", size: 14).weight(.medium))
                    .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
            }
            .frame(width: 343, height: 120)
            .padding(.top, 8)
            .padding(16)
            .padding([.leading, .trailing], 16)
            .background(Color.white)
            .cornerRadius(16)
            
            
        }
    }
}
struct BookingDetailRow: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(.secondaryLabel))
            
            Spacer()
            
            Text(value)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(.label))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}
