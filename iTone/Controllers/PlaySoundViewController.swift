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
        let pageNumber = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
        switch pageNumber {
        case 2:
            playSound(pitch: Constants.Pitches.middleC)
        case 3:
            playSound(pitch: Constants.Pitches.cSharp)
        case 4:
            playSound(pitch: Constants.Pitches.d)
        case 5:
            playSound(pitch: Constants.Pitches.eFlat)
        case 6:
            playSound(pitch: Constants.Pitches.e)
        case 7:
            playSound(pitch: Constants.Pitches.f)
        case 8:
            playSound(pitch: Constants.Pitches.fSharp)
        case 9:
            playSound(pitch: Constants.Pitches.g)
        case 10:
            playSound(pitch: Constants.Pitches.aFlat)
        case 11:
            playSound(pitch: Constants.Pitches.a)
        case 12:
            playSound(pitch: Constants.Pitches.bFlat)
        case 13:
            playSound(pitch: Constants.Pitches.b)
        case 14:
            playSound(pitch: Constants.Pitches.highC)
        default:
            break
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
