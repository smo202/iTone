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
        ScaleCardItem(scaleName: "Aeolian Mode/Natural Minor Scale", scaleFormat: "W, H, W, W, H, W, W"),
        ScaleCardItem(scaleName: "Harmonic Minor Scale", scaleFormat: "W, H, W, W, H, WH, H"),
        ScaleCardItem(scaleName: "Dorian Mode", scaleFormat: "W, H, W, W, W, H, W"),
        ScaleCardItem(scaleName: "Phrygian Mode", scaleFormat: "H, W, W, W, H, W, W"),
        ScaleCardItem(scaleName: "Lydian Mode", scaleFormat: "W, W, W, H, W, W, H"),
        ScaleCardItem(scaleName: "Mixolydian Mode", scaleFormat: "W, W, H, W, W, H, W"),
        ScaleCardItem(scaleName: "Locrian Mode", scaleFormat: "H, W, W, H, W, W, W")
    ]
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.CollectionViewCell.scaleCollectionViewCell)
        playButton.layer.cornerRadius = 10
        super.viewDidLoad()
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
