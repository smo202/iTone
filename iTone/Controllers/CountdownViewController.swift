//
//  CountdownViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/18/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    @IBOutlet weak var countdownLabel: UILabel!

    var count = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCount), userInfo: nil, repeats: true)
    }
    
    func updateCount() {
        if count > 0 {
            countdownLabel.text = String(count)
            count -= 1
        } else if count == 0 {
            count -= 1
            performSegue(withIdentifier: "toChallenge", sender: nil)
        }
    }
}
