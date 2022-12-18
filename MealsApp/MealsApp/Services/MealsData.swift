// MealsData.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import Foundation
class MealsData {
    
    static let shared = MealsData()
    var meals: [Meal]

    private init() {
        meals = [Meal(name: "Картошка фри", price: 5.0, image: #imageLiteral(resourceName: "Фри_M.png")),
                 Meal(name: "Картошка по-деревенски", price: 5.5, image: #imageLiteral(resourceName: "Деревня_M.png")),
                 Meal(name: "Чикенбургер", price: 3.0, image: #imageLiteral(resourceName: "Чикенбургер.png")),
                 Meal(name: "Биг тейсти", price: 12.4, image: #imageLiteral(resourceName: "Биг-Тейсти.png")),
                 Meal(name: "Наггетсы", price: 8.0, image: #imageLiteral(resourceName: "наггетсы.png")),
                 Meal(name: "Тройной чизбургер", price: 10.6, image: #imageLiteral(resourceName: "ТройнойЧизбургер.png")),
                 Meal(name: "Двойной филе-о-фиш", price: 8.9, image: #imageLiteral(resourceName: "Двойной-Филе-о-фиш.png")),
                 Meal(name: "Сок апельсиновый", price: 3.0, image: #imageLiteral(resourceName: "Апельсиновый-сок.png")),
                 Meal(name: "Кола", price: 4.2, image: #imageLiteral(resourceName: "кола.png")),
                 Meal(name: "Вода", price: 3.0, image: #imageLiteral(resourceName: "Банаква-негазированная.png"))]
    }
}
