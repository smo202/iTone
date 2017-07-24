//
//  Constants.swift
//  iTone
//
//  Created by Jerry Lu on 7/17/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import Foundation

struct Constants {
    struct CollectionViewCell {
        static let noteCollectionViewCell = "NoteCollectionViewCell"
        static let scaleCollectionViewCell = "ScaleCollectionViewCell"
    }
    
    struct Pitches {
        static let middleC = "middle-c"
        static let aFlat = "a-flat"
        static let a = "a"
        static let bFlat = "b-flat"
        static let b = "b"
        static let cSharp = "c-sharp"
        static let d = "d"
        static let eFlat = "e-flat"
        static let e = "e"
        static let fSharp = "f-sharp"
        static let f = "f"
        static let g = "g"
        static let highC = "high-c"
        static let highAFlat = "high-a-flat"
        static let highA = "high-a"
        static let highBFlat = "high-b-flat"
        static let highB = "high-b"
        static let highCSharp = "high-c-sharp"
        static let highD = "high-d"
        static let highEFlat = "high-e-flat"
        static let highE = "high-e"
        static let highFSharp = "high-f-sharp"
        static let highF = "high-f"
        static let highG = "high-g"
        static let shortMiddleC = "short-middle-c"
        static let shortHighC = "short-high-c"
        static let shortAFlat = "short-a-flat"
        static let shortA = "short-a"
        static let shortBFlat = "short-b-flat"
        static let shortB = "short-b"
        static let shortCSharp = "short-c-sharp"
        static let shortD = "short-d"
        static let shortEFlat = "short-e-flat"
        static let shortE = "short-e"
        static let shortFSharp = "short-f-sharp"
        static let shortF = "short-f"
        static let shortG = "short-g"
    }
    
    struct Segues {
        static let correctAnswer = "correctAnswerSegue"
        static let wrongAnswer = "wrongAnswerSegue"
        static let toApp = "toAppSegue"
    }
    
    struct ArrangedPitches {
        static let arrayOfArrangedPitches = [
            Constants.Pitches.shortMiddleC,
            Constants.Pitches.shortCSharp,
            Constants.Pitches.shortD,
            Constants.Pitches.shortEFlat,
            Constants.Pitches.shortE,
            Constants.Pitches.shortF,
            Constants.Pitches.shortFSharp,
            Constants.Pitches.shortG,
            Constants.Pitches.shortAFlat,
            Constants.Pitches.shortA,
            Constants.Pitches.shortBFlat,
            Constants.Pitches.shortB,
            Constants.Pitches.shortHighC,
            Constants.Pitches.highCSharp,
            Constants.Pitches.highD,
            Constants.Pitches.highEFlat,
            Constants.Pitches.highE,
            Constants.Pitches.highF,
            Constants.Pitches.highFSharp,
            Constants.Pitches.highG,
            Constants.Pitches.highAFlat,
            Constants.Pitches.highA,
            Constants.Pitches.highBFlat,
            Constants.Pitches.highB
        ]
    }
}
