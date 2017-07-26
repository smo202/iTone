//
//  ScalesChallengeViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/25/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit
import AVFoundation

class ScalesChallengeViewController: UIViewController {
    static var scaleNumber: Int = 0

    @IBOutlet weak var playAgainButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.layer.cornerRadius = 10
        ScalesChallengeViewController.scaleNumber = Int(arc4random_uniform(8))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1.0)
        ScalesChallengeViewController.scaleNumber = Int(arc4random_uniform(8))
    }

    func checkScaleNumber(_ value: Int) {
        if ScalesChallengeViewController.scaleNumber == value {
            ScalesPracticeViewController.player?.pause()
            performSegue(withIdentifier: Constants.Segues.correctAnswer, sender: self)
        } else {
            ScalesPracticeViewController.player?.pause()
            performSegue(withIdentifier: Constants.Segues.wrongAnswer, sender: self)
        }
    }
}

extension ScalesChallengeViewController {
    override func viewDidAppear(_ animated: Bool) {
        switch ScalesChallengeViewController.scaleNumber {
        case 0:
            ScalesPracticeViewController.playSound(scale: "Ionian")
        case 1:
            ScalesPracticeViewController.playSound(scale: "Aeolian")
        case 2:
            ScalesPracticeViewController.playSound(scale: "Harmonic Minor")
        case 3:
            ScalesPracticeViewController.playSound(scale: "Dorian")
        case 4:
            ScalesPracticeViewController.playSound(scale: "Phrygian")
        case 5:
            ScalesPracticeViewController.playSound(scale: "Lydian")
        case 6:
            ScalesPracticeViewController.playSound(scale: "Mixolydian")
        case 7:
            ScalesPracticeViewController.playSound(scale: "Locrian")
        default:
            break
        }
    }
}

extension ScalesChallengeViewController {
    @IBAction func ionianPressed(_ sender: Any) {
        checkScaleNumber(0)
    }
    @IBAction func aeolianPressed(_ sender: Any) {
        checkScaleNumber(1)
    }
    @IBAction func harmonicPressed(_ sender: Any) {
        checkScaleNumber(2)
    }
    @IBAction func dorianPressed(_ sender: Any) {
        checkScaleNumber(3)
    }
    @IBAction func phrygianPressed(_ sender: Any) {
        checkScaleNumber(4)
    }
    @IBAction func lydianPressed(_ sender: Any) {
        checkScaleNumber(5)
    }
    @IBAction func mixolydianPressed(_ sender: Any) {
        checkScaleNumber(6)
    }
    @IBAction func locrianPressed(_ sender: Any) {
        checkScaleNumber(7)
    }
    @IBAction func playAgainPressed(_ sender: Any) {
        switch ScalesChallengeViewController.scaleNumber {
        case 0:
            ScalesPracticeViewController.playSound(scale: "Ionian")
        case 1:
            ScalesPracticeViewController.playSound(scale: "Aeolian")
        case 2:
            ScalesPracticeViewController.playSound(scale: "Harmonic Minor")
        case 3:
            ScalesPracticeViewController.playSound(scale: "Dorian")
        case 4:
            ScalesPracticeViewController.playSound(scale: "Phrygian")
        case 5:
            ScalesPracticeViewController.playSound(scale: "Lydian")
        case 6:
            ScalesPracticeViewController.playSound(scale: "Mixolydian")
        case 7:
            ScalesPracticeViewController.playSound(scale: "Locrian")
        default:
            break
        }
    }
}
