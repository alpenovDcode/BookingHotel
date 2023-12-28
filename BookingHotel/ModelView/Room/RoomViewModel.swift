//
//  RoomViewModel.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI
import Combine

class RoomViewModel: ObservableObject {
    @Published var rooms: [Room] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchRooms()
    }

    func fetchRooms() {
        isLoading = true
        NetworkRoom.shared.fetchRooms()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.isLoading = false
                    self?.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] rooms in
                self?.rooms = rooms
            }
            .store(in: &cancellables)
    }
}


