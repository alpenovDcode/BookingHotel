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
    @State private var tourist = Tourist()
    @State var isPaymentSuccessful = false
    @State private var areFieldsValid = true
    @State private var isNavigationActive = false
    @ObservedObject var validationState: ValidationState

    
    var body: some View {
        NavigationStack{
            VStack {
                HeaderSection(title: "Бронирование")
                    .padding(0)
                    .padding(.bottom, -16)
                
                ScrollView {
                    if let bookingData = viewModel.bookingDetails {
                        VStack(spacing: 8) {
                            RoundedRectangleSection(sectionHeight: 120) {
                                BookingDetailView(bookingData: bookingData)
                            }
                            .padding(.top, 8)
                            
                            RoundedRectangleSection(sectionHeight: 280) {
                                VStack(spacing: 8) {
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
                            }
                            .padding(.top, 8)
                            
                            RoundedRectangleSection(sectionHeight: 260) {
                                CustomerInformationView()
                            }
                            .padding(.top, 8)
                            
                            RoundedRectangleSection(sectionHeight: 460) {
                                TouristInformationView(tourist: $tourist, validationState: validationState, title: "Первый турист")
                            }
                            .padding(.top, 8)
                            RoundedRectangleSection(sectionHeight: 58) {
                                HStack {
                                    Text("Второй турист")
                                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.leading, .trailing], 16)
                                    
                                    Spacer()
                                    
                                    Image("Arrow")
                                        .padding(.leading, 10)
                                        .padding(.trailing, 8)
                                        .padding(.vertical, 12)
                                }
                            }
                            .padding(.top, 8)
                            RoundedRectangleSection(sectionHeight: 58) {
                                HStack {
                                    Text("Добавить туриста")
                                        .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding([.leading, .trailing], 16)
                                    
                                    Spacer()
                                    
                                    Image("Plus")
                                        .padding(.leading, 10)
                                        .padding(.trailing, 8)
                                        .padding(.vertical, 12)
                                }
                            }
                            .padding(.top, 8)
                            RoundedRectangleSection(sectionHeight: 156) {
                                VStack(spacing: 8) {
                                    ForEach([
                                        ("Тур", bookingData.tourPrice),
                                        ("Топливный сбор", bookingData.fuelCharge),
                                        ("Сервисный сбор", bookingData.serviceCharge),
                                        ("К оплате", bookingData.tourPrice)
                                    ], id: \.0) { label, value in
                                        BookingDetailPriceRow(label: label, value: value)
                                            .padding([.leading, .trailing], 16)
                                            .background(Color.white)
                                            .cornerRadius(12)
                                    }
                                }
                                .padding([.bottom,.top], 16)
                            }
                            .padding(.top, 8)
                            
                            RoundedRectangleSection(sectionHeight: 88) {
                                NavigationLink(destination: isPayedView(), isActive: $isNavigationActive) {
                                    EmptyView()
                                }
                                Button(action: {
                                    // Ваша логика оплаты
                                    isPaymentSuccessful = true
                                    validationState.isValidationEnabled = true // Устанавливаем в true при нажатии на кнопку
                                    validateFields()
                                    isNavigationActive = areFieldsValid
                                }) {
                                    Text("Оплатить")
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                                .padding([.leading, .trailing], 16)
                                .frame(width: 375, height: 88)
                                .background(.white)
                            }
                            .padding(.top, 8)
                            
                        }
                    } else {
                        ProgressView()
                    }
                }
                .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
            .onAppear {
                viewModel.fetchBookingDetails()
            }
            .environmentObject(bookingDetailViewModel)
            
        }
        
    }
    private func validateFields() {
        areFieldsValid = !tourist.firstName.isEmpty &&
        !tourist.lastName.isEmpty &&
        !tourist.birthDate.isEmpty &&
        !tourist.citizenship.isEmpty &&
        !tourist.international_passport.isEmpty &&
        !tourist.the_validity_of_international_passport.isEmpty
        
    }
    
}
