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
    
    // PhoneNumberKit instance for formatting phone number
    private let phoneNumberKit = PhoneNumberKit()
    private let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
    
    var body: some View {
        VStack {
            Text("Информация о покупателе")
                .font(
                    Font.custom("SF Pro Display", size: 22)
                        .weight(.medium)
                )
                .foregroundColor(.black)
                .frame(width: 343, alignment: .topLeading)
                .padding(.bottom, 10)
                .padding(.bottom, 24)
            
            // TextField for phone number with automatic formatting
            PhoneNumberTextField(title: "Номер телефона", text: $phoneNumber, phoneNumberKit: phoneNumberKit)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray4))
                )
                .foregroundColor(.black)
                .padding(.horizontal)
            ValidatedTextField(title: "Почта", text: $email, validationRegex: emailRegex)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemGray4))
                )
                .foregroundColor(.black)
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
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
    let phoneNumberKit: PhoneNumberKit
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextField("+7 (***) ***-**-**", text: $text, onEditingChanged: { editing in
                if !editing {
                    // Format the phone number when editing ends
                    do {
                        let phoneNumber = try phoneNumberKit.parse(text)
                        self.text = phoneNumberKit.format(phoneNumber, toType: .international)
                    } catch {
                        print("Error formatting phone number: \(error.localizedDescription)")
                    }
                }
            })
            .keyboardType(.phonePad)
            .disableAutocorrection(true)
        }
    }
}

struct ValidatedTextField: View {
    let title: String
    @Binding var text: String
    let validationRegex: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextField("Введите адрес электронной почты", text: $text)
                .keyboardType(.emailAddress)
                .foregroundColor(.black)
                .autocapitalization(.none)
                .onChange(of: text) { newValue, _ in
                    // Validate the email address using the provided regex
                    if !newValue.isEmpty && !NSPredicate(format: "SELF MATCHES %@", validationRegex).evaluate(with: newValue) {
                        self.text = String(newValue.prefix(newValue.count - 1))
                    }
                }
        }
    }
}
