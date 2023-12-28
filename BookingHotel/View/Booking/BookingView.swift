//
//  BookingView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI

struct BookingView: View {
    @StateObject var viewModel = BookingViewModel()
    @StateObject var bookingDetailViewModel = BookingDetailViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                if let bookingData = viewModel.bookingDetails {
                    VStack(alignment: .leading, spacing: 8) {
                        BookingDetailView(bookingData: bookingData)
                            .padding(16)
                            .background(Color.white)
                            .cornerRadius(15)
                            .padding(.bottom, 8)

                        VStack(alignment: .leading, spacing: 16) {
                            ForEach([
                                ("Вылет из", bookingData.departure),
                                ("Страна, город", bookingData.arrivalCountry),
                                ("Даты", "\(bookingData.tourDateStart) – \(bookingData.tourDateStop)"),
                                ("Кол-во ночей", "\(bookingData.numberOfNights) ночей"),
                                ("Отель", bookingData.hotelName),
                                ("Номер", bookingData.room),
                                ("Питание", bookingData.nutrition)
                            ], id: \.0) { label, value in
                                BookingDetailRow(label: label, value: value)
                                    .padding([.leading, .trailing], 16)
                                    .background(Color.white)
                                    .cornerRadius(12)
                            }
                        }
                        VStack{
                            CustomerInformationView()
                        }
                    }
                    .padding([.leading, .trailing], 16)
                    .padding(.bottom, 8)
                } else {
                    ProgressView()
                }
            }
            .navigationBarTitle("Бронирование", displayMode: .inline)
            .navigationBarHidden(false)
            .background(Color.white)
        }
        .onAppear {
            viewModel.fetchBookingDetails()
        }
        .environmentObject(bookingDetailViewModel) // Inject the view model as an environment object
    }
}
