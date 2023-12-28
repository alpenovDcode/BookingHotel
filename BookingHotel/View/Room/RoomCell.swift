//
//  SwiftUIView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI

struct RoomCell: View {
    let room: Room
    @StateObject private var validationState = ValidationState()
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                HStack{
                    Text(room.name)
                        .font(.title)
                        .font(
                            Font.custom("SF Pro Display", size: 22)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                        .frame(width: 343, alignment: .topLeading)
                }
                .padding([.leading, .trailing], 16)
                HStack {
                    ForEach(room.peculiarities, id: \.self) { peculiarity in
                        Text(peculiarity)
                            .font(.caption)
                            .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .padding(10)
                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                            .cornerRadius(5)
                    }
                }
                .padding([.top,.bottom], 8)
                .padding([.leading, .trailing], 16)
                DetailButtonView()
                    .padding([.leading, .trailing], 16)
                HStack {
                    Text("\(room.price) ₽")
                        .font(
                            Font.custom("SF Pro Display", size: 30)
                                .weight(.semibold)
                        )
                        .foregroundColor(.black)
                    Text(room.pricePer)
                        .font(.subheadline)
                        .font(Font.custom("SF Pro Display", size: 16))
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        .padding(.top, 10)
                }
                .padding([.leading, .trailing], 16)
                
                NavigationLink(destination: BookingView(validationState: validationState)) {
                    Text("Выбрать номер")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding([.leading, .trailing], 16)
                .padding([.top, .bottom], 16)
                .frame(width: 375, height: 88)
                .background(.white)
                
            }
        }
        .padding(.horizontal)
        
    }
}

struct DetailButtonView: View {
    var body: some View {
        Button(action: {
            // Действие кнопки
            print("Подробнее о номере")
        }) {
            HStack{
                Text("Подробнее о номере")
                    .fontWeight(.semibold)
                    .font(
                        Font.custom("SF Pro Display", size: 16)
                            .weight(.medium)
                    )
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                
                Image(systemName: "arrow.right") // Используем SF Symbols для стрелки
                    .frame(width: 6, height: 12)
                    .padding(.leading, 10)
                    .padding(.trailing, 8)
                    .padding(.vertical, 6)
                    .padding(.top, 5)
            }
            .frame(height: 29, alignment: .leading)
            .padding(.leading, 10)
            .padding(.bottom, 5)
            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
            .cornerRadius(5)
        }
    }
}
