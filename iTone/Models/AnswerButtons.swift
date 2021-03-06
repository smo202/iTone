//
//  AnswerButtons.swift
//  iTone
//
//  Created by Jerry Lu on 7/18/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import Foundation
import UIKit

class AnswerButtons: UIButton {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.borderWidth = 1.0
        layer.cornerRadius = 2
        layer.borderColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1.0).cgColor
    }
}
