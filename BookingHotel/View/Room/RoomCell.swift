//
//  SwiftUIView.swift
//  BookingHotel
//
//  Created by Альпеша on 27.12.2023.
//

import SwiftUI


struct RoomCell: View {
    let room: Room

    var body: some View {
        VStack(alignment: .leading) {
            Text(room.name)
                .font(.headline)

            // Display room options here
            ForEach(room.peculiarities, id: \.self) { peculiarity in
                Text(peculiarity)
            }

            Text("\(room.price) ₽")
                .font(.title2)
            Text(room.pricePer)
                .font(.subheadline)
                .foregroundColor(.gray)

            NavigationLink(destination: Text("Booking Screen Placeholder")) {
                Text("Выбрать номер")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
