//
//  isPayedView.swift
//  BookingHotel
//
//  Created by Альпеша on 29.12.2023.
//

import SwiftUI

struct isPayedView: View {
    
    
    var randomID: Int {
        generateRandomID()
    }
    
    func generateRandomID() -> Int {
        return Int.random(in: 100000...999999)
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header в самом вверху
                HeaderSection(title: "Отель")
                    .padding(0)
                    .padding(.bottom, -16)
                
                
                Spacer()
                VStack {
                    Text("🎉")
                        .font(.system(size: 44))
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 1000)
                                .foregroundColor(Color(red: 0.96, green: 0.96, blue: 0.98))
                                .frame(width:94,height: 94)
                        )
                        .padding(.bottom, 30)
                    VStack(alignment: .center, spacing: 20) {
                        Text("Ваш заказ принят в работу")
                            .font(
                                Font.custom("SF Pro Display", size: 22)
                                    .weight(.medium)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 343, alignment: .top)
                            .padding(.bottom, 20)
                        
                        Text("Подтверждение заказа №\(randomID) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                            .font(Font.custom("SF Pro Display", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .frame(width: 329, alignment: .top)
                    }
                    .padding(25)
                }
                Spacer() // Пространство между текстом и кнопкой
                // Нижний раздел с кнопкой в самом низу
                RoundedRectangleSection(sectionHeight: 88) {
                    NavigationLink(destination: HotelView()) {
                        Text("Супер!")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding([.leading, .trailing], 16)
                    .frame(width: 375, height: 88)
                    .background(.white)
                    .overlay(
                        Rectangle()
                            .inset(by: -0.5)
                            .stroke(Color(red: 0.91, green: 0.91, blue: 0.93), lineWidth: 1)
                    )
                }
                .padding(8)
            }
            .background(.white)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}




#Preview {
    isPayedView()
}
