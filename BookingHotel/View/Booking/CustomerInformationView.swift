//
//  CustomerInformationView.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//

import SwiftUI
import PhoneNumberKit

struct CustomerInformationView: View {
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var isEmailValid = true
    
    // PhoneNumberKit instance for formatting phone number
    private let phoneNumberKit = PhoneNumberKit()
    private let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Информация о покупателе")
                .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
            
            PhoneNumberTextField(title: "Номер телефона", text: $phoneNumber)
                .padding(.leading, 16)
                .padding(.trailing, 134)
                .padding(.vertical, 8)
                .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                .cornerRadius(10)
                .padding(.bottom, -8)
            
            ValidatedTextField(title: "Почта", text: $email, validationRegex: emailRegex, isValid: $isEmailValid)
                .padding(.leading, 16)
                .padding(.trailing, 134)
                .padding(.vertical, 8)
                .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color(red: 0.92, green: 0.34, blue: 0.34, opacity: isEmailValid ? 0 : 0.15), lineWidth: 2)
                )
            
            Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту")
                .font(Font.custom("SF Pro Display", size: 14))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                .frame(width: 343, alignment: .topLeading)
        }
        .padding()
    }
}

struct PhoneNumberTextField: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextField("+7 (***) ***-**-**", text: $text)
                .font(.system(size: 16, design: .default))
                .keyboardType(.phonePad)
                .foregroundColor(.black)
                .disableAutocorrection(true)
                .onChange(of: text) { newValue, _ in
                    // Обработка ввода и форматирование номера телефона
                    var formattedText = newValue.filter { "0123456789".contains($0) }
                    
                    if formattedText.hasPrefix("8") {
                        formattedText.removeFirst()
                        formattedText = "+7" + formattedText
                    } else if formattedText.hasPrefix("9") {
                        formattedText = "+7 (" + formattedText.prefix(1) + ")"
                            + formattedText.dropFirst(1)
                    }
                    
                    // Ограничение до 10 символов
                    if formattedText.count > 11 {
                        formattedText = String(formattedText.prefix(10))
                        self.text = formattedText
                    } else {
                        self.text = formattedText
                    }
                }
        }
    }
}

struct ValidatedTextField: View {
    let title: String
    @Binding var text: String
    let validationRegex: String
    @Binding var isValid: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextField("Введите адрес электронной почты", text: $text)
                .keyboardType(.emailAddress)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(.black)
                .autocapitalization(.none)
                .onChange(of: text) { newValue, _ in
                    isValid = NSPredicate(format: "SELF MATCHES %@", validationRegex).evaluate(with: newValue)
                    
                    if !newValue.isEmpty && isValid {
                        self.text = newValue
                    }
                }
        }
    }
}
