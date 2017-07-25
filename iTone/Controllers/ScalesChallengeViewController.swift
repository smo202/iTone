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
    }
    @IBAction func aeolianPressed(_ sender: Any) {
    }
    @IBAction func harmonicPressed(_ sender: Any) {
    }
    @IBAction func dorianPressed(_ sender: Any) {
    }
    @IBAction func phrygianPressed(_ sender: Any) {
    }
    @IBAction func lydianPressed(_ sender: Any) {
    }
    @IBAction func mixolydianPressed(_ sender: Any) {
    }
    @IBAction func locrianPressed(_ sender: Any) {
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
