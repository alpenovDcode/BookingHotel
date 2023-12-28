//
//  Tourist.swift
//  BookingHotel
//
//  Created by Альпеша on 29.12.2023.
//

import SwiftUI

struct Tourist: Identifiable {
    var id = UUID()
    var firstName: String = ""
    var lastName: String = ""
    var birthDate: String = ""
    var citizenship: String = ""
    var international_passport: String = ""
    var the_validity_of_international_passport: String = ""
    
    var invalidField: String? {
        if firstName.isEmpty { return "Имя" }
        if lastName.isEmpty { return "Фамилия" }
        if birthDate.isEmpty { return "Дата рождения" }
        if citizenship.isEmpty { return "Гражданство" }
        if international_passport.isEmpty { return "Номер загранпаспорта" }
        if the_validity_of_international_passport.isEmpty { return "Срок действия загранпаспорта" }
        return nil
    }
    
    var areFieldsValid: Bool {
        return invalidField == nil
    }
}
