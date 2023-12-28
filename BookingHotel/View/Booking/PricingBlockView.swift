//
//  PricingBlockView.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//
import Foundation
import SwiftUI

struct PricingBlockView: View {
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
    
    var total: Int {
        tourPrice + fuelCharge + serviceCharge
    }
    
    var body: some View {
        VStack {
            Text("Tour Price: \(tourPrice)₽")
            Text("Fuel Charge: \(fuelCharge)₽")
            Text("Service Charge: \(serviceCharge)₽")
            Text("Total: \(total)₽")
                .bold()
            Button("Pay \(total)₽") {
                // Payment logic goes here
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
