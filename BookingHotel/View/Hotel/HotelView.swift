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
        NavigationStack {
            VStack {
                HeaderSection(title: "Отель")
                    .padding(0)
                    .padding(.bottom, -16)
                
                ScrollView {
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let hotel = viewModel.hotel {
                        VStack(spacing: 8) {
                            RoundedRectangleSection(sectionHeight: 429) {
                                VStack(spacing: 0) {
                                    Spacer() // Отступ сверху
                                    ImageCarouselView(images: hotel.imageUrls)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding([.leading, .trailing], 16)
                                    Spacer() // Отступ снизу
                                    HotelInfoView(hotel: hotel)
                                }
                            }
                            
                            RoundedRectangleSection(sectionHeight: 428) {
                                HotelDetailsView(hotelDescription: hotel.aboutTheHotel.description)
                            }
                            
                            RoundedRectangleSection(sectionHeight: 88) {
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
                            }
                        }
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                    }
                }
                .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                .padding(8)
            }
            .navigationBarHidden(false)
            .background(Color.white)
        }
    }
}
