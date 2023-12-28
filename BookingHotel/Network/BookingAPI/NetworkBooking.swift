//
//  NetworkBooking.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import Alamofire
import Combine

class NetworkBooking {
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchBookingDetails(completion: @escaping (Result<BookingData, Error>) -> Void) {
        let url = "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
        
        AF.request(url)
            .publishDecodable(type: BookingData.self)
            .sink(receiveCompletion: { completionValue in
                switch completionValue {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    break
                }
            }, receiveValue: { response in
                if let bookingData = response.value {
                    completion(.success(bookingData))
                }
            })
            .store(in: &cancellables)
    }
}
