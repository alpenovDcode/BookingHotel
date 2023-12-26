//
//  HotelView.swift
//  BookingHotel
//
//  Created by Альпеша on 26.12.2023.
//

import SwiftUI

struct HotelView: View {
    @StateObject var viewModel = HotelViewModel()
    @State private var goToRoomList = false
    var body: some View {
        ScrollView {
            VStack{
                if viewModel.isLoading {
                    ProgressView()
                } else if let hotel = viewModel.hotel {
                    ImageCarouselView(images: hotel.imageUrls)
                    HotelInfoView(hotel: hotel)
                    HotelDetailsView(hotelDescription: hotel.aboutTheHotel)
                    
                    Button(action: {
                        self.goToRoomList = true
                    }) {
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
        .fullScreenCover(isPresented: $goToRoomList) {
            RoomListView(hotelName: "Steigenberger Makadi")
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
