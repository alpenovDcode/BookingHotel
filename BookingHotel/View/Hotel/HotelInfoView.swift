//
//  HotelInfoView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//
import SwiftUI

struct HotelInfoView: View {
    let hotel: HotelModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(hotel.name)
                .font(.custom("SF Pro Display", size: 22).weight(.medium))
                .foregroundColor(.black)
                .frame(width: 343, alignment: .topLeading)
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 8)
            Text(hotel.address)
                .font(.custom("SF Pro Display", size: 14).weight(.medium))
                .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                .frame(width: 343, alignment: .topLeading)
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 8)
            
            HStack {
                Text("от \(hotel.minimalPrice) ₽")
                    .font(
                    Font.custom("SF Pro Display", size: 25)
                    .weight(.semibold)
                    )
                    .foregroundColor(.black)
                Text(hotel.priceForIt)
                    .font(.subheadline)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .padding(.top, 10)
            }
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 8)
        }
        .padding()
    }
}
