//
//  NetworkRoom.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//


import Alamofire
import Combine

class NetworkRoom {
    static let shared = NetworkRoom()

    func fetchRooms() -> AnyPublisher<[Room], AFError> {
        let url = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
        return AF.request(url)
            .validate()
            .publishDecodable(type: RoomResponse.self)
            .value()
            .map { $0.rooms }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

struct RoomResponse: Codable {
    let rooms: [Room]
}
