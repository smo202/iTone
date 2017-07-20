//
//  ViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/12/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: Constants.Segues.toApp, sender: self)
    }
}

