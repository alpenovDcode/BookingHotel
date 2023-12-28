//
//  BookingDetailViewModel.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import Foundation
import Combine

class BookingDetailViewModel: ObservableObject {
    @Published var departureCity: String = ""
    @Published var destination: String = ""
    @Published var dates: String = ""
    @Published var numberOfNights: String = ""
    @Published var roomType: String = ""
    @Published var nutrition: String = ""
    
    @Published var bookingDetail: BookingData?

    private var cancellables: Set<AnyCancellable> = []

    func fetchBookingDetails(bookingId: Int) {
        // Replace YourAPIEndpoint with the actual API endpoint
        let apiEndpoint = "https://run.mocky.io/v3/\(bookingId)"
        
        // Use Combine to make the API request and update the values
        URLSession.shared.dataTaskPublisher(for: URL(string: apiEndpoint)!)
            .map(\.data)
            .decode(type: BookingData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] details in
                      self?.updateValues(with: details)
                  })
            .store(in: &cancellables)
    }

    private func updateValues(with details: BookingData) {
        departureCity = details.departure
        destination = details.arrivalCountry
        dates = "\(details.tourDateStart) – \(details.tourDateStop)"
        numberOfNights = "\(details.numberOfNights) ночей"
        roomType = details.room
        nutrition = details.nutrition
        bookingDetail = details
    }
}
