//
//  HotelView.swift
//  BookingHotel
//
//  Created by Альпеша on 26.12.2023.
//

import SwiftUI

struct HotelView: View {
    @StateObject var viewModel = HotelViewModel()

    var body: some View {
        ScrollView {
            VStack{
                if viewModel.isLoading {
                    ProgressView()
                } else if let hotel = viewModel.hotel {
                    ImageCarouselView(images: hotel.imageUrls)
                    HotelInfoView(hotel: hotel)
                    HotelDetailsView(hotelDescription: hotel.aboutTheHotel)
                    
                    NavigationLink(destination: RoomSelectionView()) {
                        Text("К выбору номера")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                }
            }
        }
        .navigationTitle("Hotel Details")
        .onAppear {
            viewModel.fetchHotelData()
        }
    }
}
#Preview {
    HotelView()
}
