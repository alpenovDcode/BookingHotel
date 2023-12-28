//
//  TouristInformationView.swift
//  BookingHotel
//
//  Created by Альпеша on 28.12.2023.
//
import SwiftUI

class ValidationState: ObservableObject {
    @Published var isValidationEnabled = false
}

struct ValidatingTextFieldStyle: TextFieldStyle {
    @ObservedObject var validationState: ValidationState
    var isValid: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(validationState.isValidationEnabled && !isValid ? Color.red.opacity(0.8) : Color.clear, lineWidth: 2)
            )
    }
}


struct TouristInformationView: View {
    @Binding var tourist: Tourist
        @ObservedObject var validationState: ValidationState
        @State private var areFieldsValid = true
    
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
            TextField("Имя", text: $tourist.firstName)
                .textFieldStyle(ValidatingTextFieldStyle(validationState: validationState, isValid: !tourist.firstName.isEmpty))
                                .onChange(of: validationState.isValidationEnabled) { _ in
                                    validateFields()
                                }
            
            TextField("Фамилия", text: $tourist.lastName)
                .textFieldStyle(ValidatingTextFieldStyle(validationState: validationState, isValid: !tourist.lastName.isEmpty))
                                .onChange(of: validationState.isValidationEnabled) { _ in
                                    validateFields()
                                }
            
            TextField("Дата рождения", text: $tourist.birthDate)
                .textFieldStyle(ValidatingTextFieldStyle(validationState: validationState, isValid: !tourist.birthDate.isEmpty))
                                .onChange(of: validationState.isValidationEnabled) { _ in
                                    validateFields()
                                }
            
            TextField("Гражданство", text: $tourist.citizenship)
                .textFieldStyle(ValidatingTextFieldStyle(validationState: validationState, isValid: !tourist.citizenship.isEmpty))
                                .onChange(of: validationState.isValidationEnabled) { _ in
                                    validateFields()
                                }
            
            TextField("Номер загранпаспорта", text: $tourist.international_passport)
                .textFieldStyle(ValidatingTextFieldStyle(validationState: validationState, isValid: !tourist.international_passport.isEmpty))
                                .onChange(of: validationState.isValidationEnabled) { _ in
                                    validateFields()
                                }
            
            TextField("Срок действия загранпаспорта", text: $tourist.the_validity_of_international_passport)
                .textFieldStyle(ValidatingTextFieldStyle(validationState: validationState, isValid: !tourist.the_validity_of_international_passport.isEmpty))
                                .onChange(of: validationState.isValidationEnabled) { _ in
                                    validateFields()
                                }
        }
        .padding()
        .cornerRadius(16)
    }
    
    private func validateFields() {
        areFieldsValid = !tourist.firstName.isEmpty &&
        !tourist.lastName.isEmpty &&
        !tourist.birthDate.isEmpty &&
        !tourist.citizenship.isEmpty &&
        !tourist.international_passport.isEmpty &&
        !tourist.the_validity_of_international_passport.isEmpty
        
    }
}
