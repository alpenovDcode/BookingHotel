//
//  BookingViewModel.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import SwiftUI
import Combine
import Alamofire

class BookingViewModel: ObservableObject {
    @Published var bookingDetails: BookingData?
    private var cancellable: AnyCancellable?
    
    func fetchBookingDetails() {
        let url = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
        cancellable = AF.request(url)
            .publishDecodable(type: BookingData.self)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                      self?.bookingDetails = response.value
                  })
    }
}
