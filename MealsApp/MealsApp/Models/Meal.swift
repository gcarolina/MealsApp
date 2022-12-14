//  Meal.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import UIKit
struct Meal {

    let name: String
    let price: Double
    let image: UIImage?

    var feedbacks: [Feedback] = []

    // Вычисляемые свойства которые помогают отображать данные

    var ratingBar: String {
        if let rating = rating {
            return String(repeating: "★", count: Int(rating.rounded(.up)))
        } else {
            return "Пока что нет отзывов :("
        }
    }

    // MARK: Private
    private var rating: Double? {
        if feedbacks.isEmpty {
            return nil
        } else {
            var sum: Double = 0
            for review in feedbacks {
                sum += review.mark
            }
            return sum / Double(feedbacks.count)
        }
    }
}
