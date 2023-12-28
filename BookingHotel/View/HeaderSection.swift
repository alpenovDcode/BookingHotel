//
//  HeaderSection.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import SwiftUI

struct HeaderSection: View {
    var title: String // Добавлен параметр title
    
    var body: some View {
        VStack {
            Text(title) // Используем параметр title вместо фиксированной строки
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(width: 375,height: 44)
        }
        .background(.white)
    }
}
