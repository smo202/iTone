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
    var soundValue: Int = 0
    var player: AVAudioPlayer?
    
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
        self.soundValue = Int(arc4random_uniform(13))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switch soundValue {
        case 0:
            playSound(pitch: Constants.pitches.middleC)
        case 1:
            playSound(pitch: Constants.pitches.cSharp)
        case 2:
            playSound(pitch: Constants.pitches.d)
        case 3:
            playSound(pitch: Constants.pitches.eFlat)
        case 4:
            playSound(pitch: Constants.pitches.e)
        case 5:
            playSound(pitch: Constants.pitches.f)
        case 6:
            playSound(pitch: Constants.pitches.fSharp)
        case 7:
            playSound(pitch: Constants.pitches.g)
        case 8:
            playSound(pitch: Constants.pitches.aFlat)
        case 9:
            playSound(pitch: Constants.pitches.a)
        case 10:
            playSound(pitch: Constants.pitches.bFlat)
        case 11:
            playSound(pitch: Constants.pitches.b)
        case 12:
            playSound(pitch: Constants.pitches.highC)
        default:
            break
        }
    }
    
    func checkSoundValue(_ value: Int) {
        if soundValue == value {
            print("Correct")
        } else {
            print("Wrong")
        }
    }
    
    @IBAction func cButtonPressed(_ sender: Any) {
        if soundValue == 0 || soundValue == 12 {
            print("Correct")
        } else {
            print("Wrong")
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
