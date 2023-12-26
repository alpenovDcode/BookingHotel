//
//  RoomViewModel.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI
import Alamofire
class RoomViewModel: ObservableObject {
    @Published var rooms: [Room] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchRooms() {
        isLoading = true
        let url = "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
        
        AF.request(url).responseDecodable(of: [String: [Room]].self) { [weak self] response in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch response.result {
                case .success(let dictionary):
                    self?.rooms = dictionary["rooms"] ?? []
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
