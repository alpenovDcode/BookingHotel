//
//  RoomListView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI

struct RoomListView: View {
    @StateObject var viewModel = RoomViewModel()
    let hotelName: String

    var body: some View {
        List(viewModel.rooms) { room in
            RoomCell(room: room)
        }
        .navigationTitle(hotelName)
        .onAppear {
            viewModel.fetchRooms()
        }
    }
}
