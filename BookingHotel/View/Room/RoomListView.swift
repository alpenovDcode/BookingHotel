//
//  RoomListView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//


import SwiftUI
import Combine

struct RoomListView: View {
    @StateObject var viewModel = RoomViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage{
                    Text(errorMessage)
                } else {
                    ForEach(viewModel.rooms, id: \.id) { room in
                        VStack(spacing: 10) {
                            ImageCarouselView(images: room.imageUrls)
                            RoomCell(room: room)
                        }
                        .listRowInsets(EdgeInsets())
                        .background(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
        .navigationTitle("Rooms")
        .onAppear {
            viewModel.fetchRooms()
        }
    }
}
