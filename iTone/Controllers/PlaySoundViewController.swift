//
//  PlaySoundViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/14/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var playButton: UIButton!
    
    var player: AVAudioPlayer?
    
    let nib = UINib(nibName: Constants.CollectionViewCell.noteCollectionViewCell, bundle: nil)
    
    var arrayOfNoteCardItems: [NoteCardItem] = [
        NoteCardItem(image: #imageLiteral(resourceName: "treble-c")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-bsharp")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-c")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-csharp")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-d")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-dsharp")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-e")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-f")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-fsharp")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-g")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-gsharp")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-a")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-asharp")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-b")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-bsharp")),
        NoteCardItem(image: #imageLiteral(resourceName: "treble-c"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.CollectionViewCell.noteCollectionViewCell)
        playButton.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let start = CGPoint(x: CGFloat(2) * collectionView.bounds.size.width, y: collectionView.contentOffset.y)
        collectionView.setContentOffset(start, animated: false)
    }    
}

extension PlaySoundViewController {
    func playSound(pitch: String) {
        let url = Bundle.main.url(forResource: pitch, withExtension: "m4a")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        let pageNumber = Double(collectionView.contentOffset.x / collectionView.frame.size.width)

        if pageNumber >= 1.5 && pageNumber <= 2.5 {
            playSound(pitch: Constants.Pitches.middleC)
        } else if pageNumber >= 2.5 && pageNumber < 3.5 {
            playSound(pitch: Constants.Pitches.cSharp)
        } else if pageNumber >= 3.5 && pageNumber < 4.5 {
            playSound(pitch: Constants.Pitches.d)
        } else if pageNumber >= 4.5 && pageNumber < 5.5 {
            playSound(pitch: Constants.Pitches.eFlat)
        } else if pageNumber >= 5.5 && pageNumber < 6.5 {
            playSound(pitch: Constants.Pitches.e)
        } else if pageNumber >= 6.5 && pageNumber < 7.5 {
            playSound(pitch: Constants.Pitches.f)
        } else if pageNumber >= 7.5 && pageNumber < 8.5 {
            playSound(pitch: Constants.Pitches.fSharp)
        } else if pageNumber >= 8.5 && pageNumber < 9.5 {
            playSound(pitch: Constants.Pitches.g)
        } else if pageNumber >= 9.5 && pageNumber < 10.5 {
            playSound(pitch: Constants.Pitches.aFlat)
        } else if pageNumber >= 10.5 && pageNumber < 11.5 {
            playSound(pitch: Constants.Pitches.a)
        } else if pageNumber >= 11.5 && pageNumber < 12.5 {
            playSound(pitch: Constants.Pitches.bFlat)
        } else if pageNumber >= 12.5 && pageNumber < 13.5 {
            playSound(pitch: Constants.Pitches.b)
        } else if pageNumber >= 13.5 && pageNumber < 14.5 {
            playSound(pitch: Constants.Pitches.highC)
        } else if pageNumber >= 14.5 && pageNumber < 15.5 {
            playSound(pitch: Constants.Pitches.middleC)
        }
    }
}

extension PlaySoundViewController {
    func checkIfAtEndOfNotes(current: Int, target: Int) -> Bool {
        return current == target
    }
    func checkIfAtBeginningOfNotes(current: Int, target: Int) -> Bool {
        return current == target
    }
    
    func loopToBeginningOrEnd() {
        let pageNumber = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
        let beginningCgpoint = CGPoint(x: CGFloat(2) * collectionView.bounds.size.width, y: collectionView.contentOffset.y)
        let endingCGpoint = CGPoint(x: CGFloat(15) * collectionView.bounds.size.width - CGFloat(1), y: collectionView.contentOffset.y)
        if checkIfAtEndOfNotes(current: pageNumber, target: arrayOfNoteCardItems.count - 1) {
            collectionView.setContentOffset(beginningCgpoint, animated: false)
        } else if checkIfAtBeginningOfNotes(current: pageNumber, target: 1) {
            collectionView.setContentOffset(endingCGpoint, animated: false)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        loopToBeginningOrEnd()
    }
}

extension PlaySoundViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCell.noteCollectionViewCell, for: indexPath) as! NoteCollectionViewCell
        let noteCardItem = arrayOfNoteCardItems[indexPath.section]
        cell.imageView.image = noteCardItem.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayOfNoteCardItems.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
