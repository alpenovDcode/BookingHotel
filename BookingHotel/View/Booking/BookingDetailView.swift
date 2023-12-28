//
//  BookingDetailView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI

struct BookingDetailView: View {
    @EnvironmentObject var bookingDetailViewModel: BookingDetailViewModel
    var bookingData: BookingData
    
    var body: some View {
        VStack(alignment: .leading,spacing: 16) {
            RatingView(rating: bookingData.hotelRating, ratingText: bookingData.ratingName)
                .frame(alignment: .leading)
            Text(bookingData.hotelName)
                .font(.custom("SF Pro Display", size: 22).weight(.medium))
                .foregroundColor(.black)
            Text(bookingData.hotelAddress)
                .font(.custom("SF Pro Display", size: 14).weight(.medium))
                .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
        }
        .padding(.top, 8)
        .padding([.leading, .trailing], 8)
        .background(Color.white)
        .cornerRadius(16)
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
        .padding(.horizontal, 8)
    }
}

struct BookingDetailPriceRow: View {
    var label: String
    var value: Int
    
    var body: some View {
        HStack {
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(.secondaryLabel))
            
            Spacer()
            
            Text("\(value)")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(.label))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
    }
}
