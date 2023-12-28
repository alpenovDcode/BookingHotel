//
//  RoomListView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//


import SwiftUI

struct RoomListView: View {
    @StateObject var viewModel = RoomViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                HeaderSection(title: "Номер")
                    .padding(0)
                    .padding(.bottom, -16)
                
                ScrollView {
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                    } else {
                        ForEach(viewModel.rooms, id: \.id) { room in
                            RoundedRectangleSection(sectionHeight: 539) {
                                VStack(spacing: 0) {
                                    ImageCarouselView(images: room.imageUrls)
                                        .padding([.leading, .trailing], 16)
                                        .edgesIgnoringSafeArea(.top)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    RoomCell(room: room)
                                }
                                .padding(.top, 16)
                                .background(Color.white)
                            }
                            .padding(.top, 16)
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                .padding(8)

                .onAppear {
                    viewModel.fetchRooms()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
        }
    }
}
