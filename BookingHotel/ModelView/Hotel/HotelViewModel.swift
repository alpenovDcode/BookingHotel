//
//  HotelViewModel.swift
//  BookingHotel
//
//  Created by Альпеша on 26.12.2023.
//

import Foundation
import Alamofire

class HotelViewModel: ObservableObject {
    @Published var hotel: HotelModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    init() {
        fetchHotelData()
    }
    
    func fetchHotelData() {
        isLoading = true
        NetworkService.shared.fetchHotel { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let hotelData):
                    self?.hotel = hotelData
                case .failure(let error):
                    self?.errorMessage = error.errorDescription
                }
            }
        }
    }
}
