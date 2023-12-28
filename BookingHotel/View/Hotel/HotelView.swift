//
//  HotelView.swift
//  BookingHotel
//
//  Created by Альпеша on 26.12.2023.
//

import SwiftUI
import SwiftUI

struct HotelView: View {
    @StateObject var viewModel = HotelViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let hotel = viewModel.hotel {
                        
                        ImageCarouselView(images: hotel.imageUrls)
                        HotelInfoView(hotel: hotel)
                        Divider()
                        HotelDetailsView(hotelDescription: hotel.aboutTheHotel.description)
                        
                        NavigationLink(destination: RoomListView()) {
                            Text("К выбору номера")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding([.leading, .trailing], 16)
                        .frame(width: 375, height: 88)
                        .background(.white)
                        .overlay(
                            Rectangle()
                                .inset(by: -0.5)
                                .stroke(Color(red: 0.91, green: 0.91, blue: 0.93), lineWidth: 1)
                            
                        )
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                    }
                }
                .background(Color.white)
            }
            .navigationBarTitle("Отель", displayMode: .inline)
            .navigationBarHidden(false) // Отображаем навигационную панель
            .background(Color.white)
        }
    }
}

