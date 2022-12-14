// Feedback.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import Foundation

struct Feedback {
    
    private let date = Date()
    
    let text: String
    let mark: Double

    // Вычисляемые свойства которые помогают отображать данные
    
    var ratingBar: String {
        String(repeating: "★", count: Int(mark.rounded(.up)))
    }

    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        return dateFormatter.string(from: date)
    }
}
