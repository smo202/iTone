//
//  ScalesPracticeViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/21/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit
import AVFoundation

class ScalesPracticeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var playButton: UIButton!
    
    static var player: AVQueuePlayer?

    let nib = UINib(nibName: Constants.CollectionViewCell.scaleCollectionViewCell, bundle: nil)
    
    let arrayOfScaleCardItems: [ScaleCardItem] = [
        ScaleCardItem(scaleName: "Ionian Mode/Major Scale", scaleFormat: "W, W, H, W, W, W, H"),
        ScaleCardItem(scaleName: "Locrian Mode", scaleFormat: "H, W, W, H, W, W, W"),
        ScaleCardItem(scaleName: "Ionian Mode/Major Scale", scaleFormat: "W, W, H, W, W, W, H"),
        ScaleCardItem(scaleName: "Aeolian Mode/Natural Minor Scale", scaleFormat: "W, H, W, W, H, W, W"),
        ScaleCardItem(scaleName: "Harmonic Minor Scale", scaleFormat: "W, H, W, W, H, WH, H"),
        ScaleCardItem(scaleName: "Dorian Mode", scaleFormat: "W, H, W, W, W, H, W"),
        ScaleCardItem(scaleName: "Phrygian Mode", scaleFormat: "H, W, W, W, H, W, W"),
        ScaleCardItem(scaleName: "Lydian Mode", scaleFormat: "W, W, W, H, W, W, H"),
        ScaleCardItem(scaleName: "Mixolydian Mode", scaleFormat: "W, W, H, W, W, H, W"),
        ScaleCardItem(scaleName: "Locrian Mode", scaleFormat: "H, W, W, H, W, W, W"),
        ScaleCardItem(scaleName: "Ionian Mode/Major Scale", scaleFormat: "W, W, H, W, W, W, H")
    ]
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.CollectionViewCell.scaleCollectionViewCell)
        playButton.layer.cornerRadius = 10
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let start = CGPoint(x: CGFloat(2) * collectionView.bounds.size.width, y: collectionView.contentOffset.y)
        collectionView.setContentOffset(start, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ScalesPracticeViewController.player?.pause()
    }
    
}

extension ScalesPracticeViewController {
    static func actuallyPlaySound(randomTonic: Int, note2: String, note3: String, note4: String, note5: String, note6: String, note7: String, note8: String) {
        let url = Bundle.main.url(forResource: Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic], withExtension: "m4a")!
        let url2 = Bundle.main.url(forResource: note2, withExtension: "m4a")!
        let url3 = Bundle.main.url(forResource: note3, withExtension: "m4a")!
        let url4 = Bundle.main.url(forResource: note4, withExtension: "m4a")!
        let url5 = Bundle.main.url(forResource: note5, withExtension: "m4a")!
        let url6 = Bundle.main.url(forResource: note6, withExtension: "m4a")!
        let url7 = Bundle.main.url(forResource: note7, withExtension: "m4a")!
        let url8 = Bundle.main.url(forResource: note8, withExtension: "m4a")!
        
        let tonicItem = AVPlayerItem(url: url)
        let item2 = AVPlayerItem(url: url2)
        let item3 = AVPlayerItem(url: url3)
        let item4 = AVPlayerItem(url: url4)
        let item5 = AVPlayerItem(url: url5)
        let item6 = AVPlayerItem(url: url6)
        let item7 = AVPlayerItem(url: url7)
        let item8 = AVPlayerItem(url: url8)
        
        ScalesPracticeViewController.player = AVQueuePlayer(items: [tonicItem, item2, item3, item4, item5, item6, item7, item8])
        ScalesPracticeViewController.player?.play()
    }
    
    static func playSound(scale: String) {
        let randomTonic = Int(arc4random_uniform(12))
        var note2: String
        var note3: String
        var note4: String
        var note5: String
        var note6: String
        var note7: String
        var note8: String
        
        switch scale {
        case "Ionian":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 2]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 4]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 5]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 7]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 9]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 11]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
            ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        case "Aeolian":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 2]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 3]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 5]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 7]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 8]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 10]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
            ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        case "Harmonic Minor":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 2]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 3]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 5]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 7]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 8]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 11]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
            ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        case "Dorian":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 2]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 3]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 5]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 7]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 9]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 10]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
            ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        case "Phrygian":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 1]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 3]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 5]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 7]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 8]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 10]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
            ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        case "Lydian":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 2]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 4]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 6]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 7]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 9]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 11]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
            ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        case "Mixolydian":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 2]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 4]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 5]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 7]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 9]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 10]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
           ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        case "Locrian":
            note2 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 1]
            note3 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 3]
            note4 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 5]
            note5 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 6]
            note6 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 8]
            note7 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 10]
            note8 = Constants.ArrangedPitches.arrayOfArrangedPitches[randomTonic + 12]
            ScalesPracticeViewController.actuallyPlaySound(randomTonic: randomTonic, note2: note2, note3: note3, note4: note4, note5: note5, note6: note6, note7: note7, note8: note8)
        default:
            break
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        let pageNumber = Double(collectionView.contentOffset.x / collectionView.frame.size.width)

        if pageNumber >= 1.5 && pageNumber <= 2.5 {
            ScalesPracticeViewController.playSound(scale: "Ionian")
        } else if pageNumber >= 2.5 && pageNumber < 3.5 {
            ScalesPracticeViewController.playSound(scale: "Aeolian")
        } else if pageNumber >= 3.5 && pageNumber < 4.5 {
            ScalesPracticeViewController.playSound(scale: "Harmonic Minor")
        } else if pageNumber >= 4.5 && pageNumber < 5.5 {
            ScalesPracticeViewController.playSound(scale: "Dorian")
        } else if pageNumber >= 5.5 && pageNumber < 6.5 {
            ScalesPracticeViewController.playSound(scale: "Phrygian")
        } else if pageNumber >= 6.5 && pageNumber < 7.5 {
            ScalesPracticeViewController.playSound(scale: "Lydian")
        } else if pageNumber >= 7.5 && pageNumber < 8.5 {
            ScalesPracticeViewController.playSound(scale: "Mixolydian")
        } else if pageNumber >= 8.5 && pageNumber < 9.5 {
            ScalesPracticeViewController.playSound(scale: "Locrian")
        } else if pageNumber >= 9.5 && pageNumber < 10.5 {
            ScalesPracticeViewController.playSound(scale: "Ionian")
        }
    }
}

extension ScalesPracticeViewController {
    func checkIfAtEndOfNotes(current: Int, target: Int) -> Bool {
        return current == target
    }
    func checkIfAtBeginningOfNotes(current: Int, target: Int) -> Bool {
        return current == target
    }
    
    func loopToBeginningOrEnd() {
        let pageNumber = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
        let beginningCgpoint = CGPoint(x: CGFloat(2) * collectionView.bounds.size.width, y: collectionView.contentOffset.y)
        let endingCGpoint = CGPoint(x: CGFloat(10) * collectionView.bounds.size.width - CGFloat(1), y: collectionView.contentOffset.y)
        if checkIfAtEndOfNotes(current: pageNumber, target: arrayOfScaleCardItems.count - 1) {
            collectionView.setContentOffset(beginningCgpoint, animated: false)
        } else if checkIfAtBeginningOfNotes(current: pageNumber, target: 1) {
            collectionView.setContentOffset(endingCGpoint, animated: false)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loopToBeginningOrEnd()
    }
}

extension ScalesPracticeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCell.scaleCollectionViewCell, for: indexPath) as! ScaleCollectionViewCell
        let scaleCardItem = arrayOfScaleCardItems[indexPath.section]
        cell.scaleNameLabel.text = scaleCardItem.scaleName
        cell.scaleFormatLabel.text = scaleCardItem.scaleFormat
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayOfScaleCardItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
