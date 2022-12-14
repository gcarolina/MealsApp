//  ReviewsTableVC.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import UIKit

class ReviewsTableVC: UITableViewController {
    var index: Int!

    var meal: Meal {
        MealsData.shared.meals[index]
    }

    override func viewDidLoad() {
        tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meal.feedbacks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedback = meal.feedbacks[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell

        cell.nameLbl.text = feedback.dateString
        cell.textLbl.text = feedback.text
        cell.ratingLbl.text = feedback.ratingBar
        return cell
    }

    // MARK: - Table view delegate
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            MealsData.shared.meals[index].feedbacks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


    // могу ли я перетаскивать ячейки из таблицы
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // откуда потащили ячейку и куда
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentMeal = MealsData.shared.meals.remove(at: fromIndexPath.row)
        MealsData.shared.meals.insert(currentMeal, at: to.row)
    }
}
