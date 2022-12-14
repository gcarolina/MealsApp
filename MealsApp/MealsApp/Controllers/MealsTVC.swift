// MealsTVC.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import UIKit

class MealsTVC: UITableViewController {
    
    var meals: [Meal] {
        MealsData.shared.meals
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let meal = meals[indexPath.row]
        CellManager.configure(cell, with: meal)
        return cell
    }
    
    // MARK: - Table view delegate
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            MealsData.shared.meals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //}
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
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowMealDetail" else {
            return
        }
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        
        let mealDetailVC = segue.destination as! MealDetailViewController
        mealDetailVC.index = indexPath.row
    }
    
    @IBAction func unwindToMealsTVC(_ unwindSegue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}
