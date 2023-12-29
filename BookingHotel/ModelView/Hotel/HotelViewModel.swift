//
//  HotelViewModel.swift
//  BookingHotel
//
//  Created by Альпеша on 26.12.2023.
//

import Combine
import Foundation

class HotelViewModel: ObservableObject {
    @Published var hotel: HotelModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchHotelData()
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }

    
    func fetchHotelData() {
        print("Fetching hotel data...")
        isLoading = true
        NetworkHotel.shared.fetchHotel()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.isLoading = false
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] hotelData in
                self?.hotel = hotelData
            }
            .store(in: &cancellables)
    }
}
