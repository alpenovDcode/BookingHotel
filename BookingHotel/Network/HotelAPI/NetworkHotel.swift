//
//  NetworkService.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI
import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    func fetchHotel(completion: @escaping (Result<HotelModel, AFError>) -> Void) {
        let url = "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
        
        AF.request(url).responseDecodable(of: HotelModel.self) { response in
            completion(response.result)
        }
    }
}
