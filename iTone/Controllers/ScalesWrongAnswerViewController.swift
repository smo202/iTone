//
//  ScalesWrongAnswerViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/26/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class ScalesWrongAnswerViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        switch ScalesChallengeViewController.scaleNumber {
        case 0:
            answerLabel.text = "The answer was: Ionian Mode/   Major Scale"
        case 1:
            answerLabel.text = "The answer was: Aeolian Mode/   Natural Minor    Scale"
        case 2:
            answerLabel.text = "The answer was: Harmonic Minor Scale"
        case 3:
            answerLabel.text = "The answer was: Dorian Mode"
        case 4:
            answerLabel.text = "The answer was: Phrygian Mode"
        case 5:
            answerLabel.text = "The answer was: Lydian Mode"
        case 6:
            answerLabel.text = "The answer was: Mixolydian        Mode"
        case 7:
            answerLabel.text = "The answer was: Locrian Mode"
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
