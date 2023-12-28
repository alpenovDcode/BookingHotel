//
//  HotelDetailsView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//
import Foundation
import SwiftUI

struct HotelDetailsView: View {
    let hotelDescription: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Об отеле")
                .font(.custom("SF Pro Display", size: 22).weight(.medium))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
                .padding([.bottom,.top], 16)
            
            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    Text("3-я линия")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        .padding(10)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(5)
                    
                    Text("Платный Wi-Fi в фойе")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        .padding(10)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(5)
                }
                .padding([.leading, .trailing], 16)
                
                HStack(spacing: 8) {
                    Text("30 км до аэропорта")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        .padding(10)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(5)
                    
                    Text("1 км до пляжа")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        .padding(10)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(5)
                }
                .padding([.leading, .trailing], 16)
            }
            .padding([.top,.bottom], 8)
            
            
            
            Text(hotelDescription)
                .font(.custom("SF Pro Display", size: 16))
                .foregroundColor(.black.opacity(0.9))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
            
            VStack(alignment: .trailing, spacing: 10){
                InformationRowView(iconName: "smiley", text: "Удобства")
                Image("Vector 56")
                    .frame(width: 275, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.51, green: 0.53, blue: 0.59).opacity(0.15), lineWidth: 1)
                        
                    )
                InformationRowView(iconName: "checkmark", text: "Что включено")
                Image("Vector 56")
                    .frame(width: 275, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.51, green: 0.53, blue: 0.59).opacity(0.15), lineWidth: 1)
                        
                    )
                InformationRowView(iconName: "xmark", text: "Что не включено")
            }
            .padding(.top, 16)
            .padding(.bottom, 28)
            .padding([.leading, .trailing], 16)
            .padding(15)
            .foregroundColor(.black)
            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
            .cornerRadius(15)
        }
        .background(.white)
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
