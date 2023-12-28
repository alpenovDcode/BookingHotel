//
//  NetworkService.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//



import Combine
import Alamofire

class NetworkHotel {
    static let shared = NetworkHotel()

    func fetchHotel() -> AnyPublisher<HotelModel, Error> {
        let url = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
        return AF.request(url)
            .validate(statusCode: 200..<300)
            .publishDecodable(type: HotelModel.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}

