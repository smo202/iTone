//
//  ChallengeViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/18/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ChallengeViewController: UIViewController {
    var player: AVAudioPlayer?
    static var soundValue: Int = 0
    
    func playSound(pitch: String) {
        let url = Bundle.main.url(forResource: pitch, withExtension: "m4a")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.numberOfLoops = -1
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChallengeViewController.soundValue = Int(arc4random_uniform(13))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        ChallengeViewController.soundValue = Int(arc4random_uniform(13))
    }
    
    func checkSoundValue(_ value: Int) {
        if ChallengeViewController.soundValue == value {
            print("Correct")
            player?.stop()
            performSegue(withIdentifier: Constants.Segues.correctAnswer, sender: self)
        } else {
            print("Wrong")
            player?.stop()
            performSegue(withIdentifier: Constants.Segues.wrongAnswer, sender: self)
        }
    }
}

extension ChallengeViewController {
    override func viewDidAppear(_ animated: Bool) {
        switch ChallengeViewController.soundValue {
        case 0:
            playSound(pitch: Constants.Pitches.middleC)
        case 1:
            playSound(pitch: Constants.Pitches.cSharp)
        case 2:
            playSound(pitch: Constants.Pitches.d)
        case 3:
            playSound(pitch: Constants.Pitches.eFlat)
        case 4:
            playSound(pitch: Constants.Pitches.e)
        case 5:
            playSound(pitch: Constants.Pitches.f)
        case 6:
            playSound(pitch: Constants.Pitches.fSharp)
        case 7:
            playSound(pitch: Constants.Pitches.g)
        case 8:
            playSound(pitch: Constants.Pitches.aFlat)
        case 9:
            playSound(pitch: Constants.Pitches.a)
        case 10:
            playSound(pitch: Constants.Pitches.bFlat)
        case 11:
            playSound(pitch: Constants.Pitches.b)
        case 12:
            playSound(pitch: Constants.Pitches.highC)
        default:
            break
        }
    }
}

extension ChallengeViewController {
    @IBAction func cButtonPressed(_ sender: Any) {
        if ChallengeViewController.soundValue == 0 || ChallengeViewController.soundValue == 12 {
            print("Correct")
            player?.stop()
            performSegue(withIdentifier: Constants.Segues.correctAnswer, sender: self)
        } else {
            print("Wrong")
            player?.stop()
            performSegue(withIdentifier: Constants.Segues.wrongAnswer, sender: self)
        }
    }
    
    @IBAction func cSharpButtonPressed(_ sender: Any) {
        checkSoundValue(1)
    }
    
    @IBAction func dButtonPressed(_ sender: Any) {
        checkSoundValue(2)
    }
    
    @IBAction func eFlatButtonPressed(_ sender: Any) {
        checkSoundValue(3)
    }
    
    @IBAction func eButtonPressed(_ sender: Any) {
        checkSoundValue(4)
    }
    
    @IBAction func fButtonPressed(_ sender: Any) {
        checkSoundValue(5)
    }
    
    @IBAction func fSharpButtonPressed(_ sender: Any) {
        checkSoundValue(6)
    }
    
    @IBAction func gButtonPressed(_ sender: Any) {
        checkSoundValue(7)
    }
    
    @IBAction func aFlatButtonPressed(_ sender: Any) {
        checkSoundValue(8)
    }
    
    @IBAction func aButtonPressed(_ sender: Any) {
        checkSoundValue(9)
    }
    
    @IBAction func bFlatButtonPressed(_ sender: Any) {
        checkSoundValue(10)
    }
    
    @IBAction func bButtonPressed(_ sender: Any) {
        checkSoundValue(11)
    }
}
