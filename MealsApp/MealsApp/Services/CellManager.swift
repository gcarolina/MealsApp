//  CellManager.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import UIKit

final class CellManager {
    static func configure(_ cell: UITableViewCell, with meal: Meal) {
        cell.detailTextLabel?.text = String(meal.price) + " BYN\n" + meal.ratingBar
        cell.textLabel?.text = meal.name
        cell.imageView?.image = meal.image
    }
}
