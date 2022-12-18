//  MealDetailViewController.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import UIKit

class MealDetailViewController: UIViewController {
    var index: Int!
    
    var meal: Meal {
        MealsData.shared.meals[index]
    }
    
    @IBOutlet var mealStackView: UIStackView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var mealNameLabel: UILabel!
    @IBOutlet var mealPriceLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var showReviewsBtn: UIButton!
    @IBOutlet weak var leaveReview: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(with: view.bounds.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateUI(with: size)
    }
    
    private func updateUI(with size: CGSize) {
        let isVertical = size.width < size.height
        mealStackView.axis = isVertical ? .vertical : .horizontal

        title = meal.name
        imageView.image = meal.image
        mealNameLabel.text = meal.name
        mealPriceLabel.text = String(meal.price) + " BYN"

        ratingLabel.text = meal.ratingBar

        let showReviewsBtnTitle = meal.feedbacks.count != 0 ? "Просмотреть (\(meal.feedbacks.count)) отзывов" : "Нет отзывов"
        //let showReviewsBtnTitle = "Просмотреть (\(meal.feedbacks.count)) отзывов"
        showReviewsBtn.setTitle(showReviewsBtnTitle, for: .normal)
        showReviewsBtn.isEnabled = meal.feedbacks.count != 0
        
        showReviewsBtn.layer.cornerRadius = showReviewsBtn.frame.size.height / 2
        leaveReview.layer.cornerRadius = leaveReview.frame.size.height / 2
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? FeedbackViewController {
            dest.index = index
        }
        if let dest = segue.destination as? ReviewsTableVC {
            dest.index = index
        }
    }
}
