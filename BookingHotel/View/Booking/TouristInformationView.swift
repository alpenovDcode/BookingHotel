//
//  TouristInformationView.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import SwiftUI

struct Tourist: Identifiable {
    let id = UUID()
    var firstName: String = ""
    var lastName: String = ""
    var birthDate: Date = Date()
    var passportNumber: String = ""
    // Add other fields as necessary
}

struct TouristInformationView: View {
    @Binding var tourist: Tourist
    var body: some View {
        VStack(alignment: .leading) {
            TextField("First Name", text: $tourist.firstName)
            TextField("Last Name", text: $tourist.lastName)
            DatePicker("Birth Date", selection: $tourist.birthDate, displayedComponents: .date)
            TextField("Passport Number", text: $tourist.passportNumber)
            // Add other input fields as necessary
        }
        .padding()
    }
}
