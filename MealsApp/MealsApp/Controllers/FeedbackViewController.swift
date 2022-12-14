// FeedbackViewController.swift
//  MealsApp
//  Created by Carolina on 14.12.22.

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet var feedBackTextView: UITextView!
    @IBOutlet var ratingSegment: UISegmentedControl!
    @IBOutlet var saveFeedBackBtn: UIButton!
    @IBOutlet var errorLbl: UILabel!

    var index: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        feedBackTextView.delegate = self
        saveFeedBackBtn.layer.cornerRadius = saveFeedBackBtn.frame.size.height / 2
    }

    @IBAction func saveFeedBack() {
        let feedback = Feedback(text: feedBackTextView.text,
                                mark: Double(ratingSegment.selectedSegmentIndex + 1))
        MealsData.shared.meals[index].feedbacks.append(feedback)
    }
}

// MARK: UITextViewDelegate

extension FeedbackViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView == feedBackTextView {
            let isCountEnough = textView.text.count > 20
            saveFeedBackBtn.isEnabled = isCountEnough
            errorLbl.isHidden = isCountEnough
        }
        return true
    }
}
