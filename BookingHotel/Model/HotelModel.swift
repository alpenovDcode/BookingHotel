//
//  HotelModel.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

struct HotelModel: Codable {
    let id: Int
    let name: String
    let address: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: HotelDescription

    enum CodingKeys: String, CodingKey {
        case id, name, rating, address = "adress", minimalPrice = "minimal_price", priceForIt = "price_for_it", ratingName = "rating_name", imageUrls = "image_urls", aboutTheHotel = "about_the_hotel"
    }
}

struct HotelDescription: Codable {
    let description: String
    let peculiarities: [String]
}
