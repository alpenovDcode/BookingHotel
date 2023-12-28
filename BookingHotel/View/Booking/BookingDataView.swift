//
//  BookingDataView.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//
//
//import SwiftUI
//
//struct BookingDataView: View {
//    @EnvironmentObject var bookingDetailViewModel: BookingDetailViewModel
//    
//    var body: some View {
//        if let bookingDetail = bookingDetailViewModel.bookingDetail {
//            VStack(alignment: .leading, spacing: 16){
//                BookingDetailRow(label: "Вылет из", value: bookingDetail.departure)
//                BookingDetailRow(label: "Страна, город", value: bookingDetail.arrivalCountry)
//                BookingDetailRow(label: "Даты", value: "\(bookingDetail.tourDateStart) – \(bookingDetail.tourDateStop)")
//                BookingDetailRow(label: "Кол-во ночей", value: "\(bookingDetail.numberOfNights) ночей")
//                BookingDetailRow(label: "Отель", value: bookingDetail.hotelName)
//                BookingDetailRow(label: "Номер", value: bookingDetail.room)
//                BookingDetailRow(label: "Питание", value: bookingDetail.nutrition)
//            }
//            .padding(16)
//            .background(Color.white)
//            .cornerRadius(12)
//        }
//    }
//}
