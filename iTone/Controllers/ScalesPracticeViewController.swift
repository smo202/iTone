//
//  ScalesPracticeViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/21/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class ScalesPracticeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var playButton: UIButton!
    
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
