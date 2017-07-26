//
//  WrongAnswerViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/19/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class WrongAnswerViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch ChallengeViewController.soundValue {
        case 0:
            answerLabel.text = "The answer was: B♯/C"
        case 1:
            answerLabel.text = "The answer was: C♯/D♭"
        case 2:
            answerLabel.text = "The answer was: D"
        case 3:
            answerLabel.text = "The answer was: D♯/E♭"
        case 4:
            answerLabel.text = "The answer was: E/F♭"
        case 5:
            answerLabel.text = "The answer was: E♯/F"
        case 6:
            answerLabel.text = "The answer was: F♯/G♭"
        case 7:
            answerLabel.text = "The answer was: G"
        case 8:
            answerLabel.text = "The answer was: G♯/A♭"
        case 9:
            answerLabel.text = "The answer was: A"
        case 10:
            answerLabel.text = "The answer was: A♯/B♭"
        case 11:
            answerLabel.text = "The answer was: B"
        case 12:
            answerLabel.text = "The answer was: B♯/C"
        default:
            break
        }
        nextButton.layer.cornerRadius = 10
        navigationController?.navigationBar.barTintColor = UIColor(red: 239/255, green: 76/255, blue: 52/255, alpha: 1.0)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
}
