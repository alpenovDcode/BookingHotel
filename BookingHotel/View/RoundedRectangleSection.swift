//
//  RoundedRectangleSection.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import SwiftUI

struct RoundedRectangleSection<Content: View>: View {
    var content: Content
    var sectionHeight: CGFloat
    
    init(sectionHeight: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.sectionHeight = sectionHeight
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.white)
            .frame(width: 375, height: sectionHeight)
            .overlay(
                VStack{
                    content
                        .foregroundColor(.black)
                }

            )
            
    }
}
