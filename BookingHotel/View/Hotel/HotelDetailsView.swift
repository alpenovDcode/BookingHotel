//
//  HotelDetailsView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//
import Foundation
import SwiftUI


struct HotelDetailsView: View {
    let hotelDescription: HotelDescription
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Об отеле")
            
                .font(
                    Font.custom("SF Pro Display", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
            
                .frame(width: 343, alignment: .topLeading)
            HStack {
                Text("3-я линия")
                    .font(Font.custom("SF Pro Display", size: 16).weight(.bold))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .cornerRadius(5)
                
                Spacer()
                
                Text("Платный Wi-Fi в фойе")
                    .font(Font.custom("SF Pro Display", size: 16).weight(.bold))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .cornerRadius(5)
                
            }
            .padding(10)
            
            HStack {
                Text("30 км до аэропорта")
                    .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .cornerRadius(5)
                
                
                Spacer()
                
                Text("1 км до пляжа")
                    .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .cornerRadius(5)
                
            }
            .padding(10)
            Text(hotelDescription.description)
                .font(Font.custom("SF Pro Display", size: 16))
                .lineSpacing(19.20)
                .foregroundColor(Color.black.opacity(0.90))
            
            // Reusable view for the rows with icons
            InformationRowView(iconName: "smiley", text: "Удобства")
            InformationRowView(iconName: "checkmark", text: "Что включено")
            InformationRowView(iconName: "xmark", text: "Что не включено")
            
        }
        .padding(.horizontal)
    }
}

struct InformationRowView: View {
    let iconName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            Text(text)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}
