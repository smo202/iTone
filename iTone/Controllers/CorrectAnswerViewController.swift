//
//  CorrectAnswerViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/19/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class CorrectAnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
