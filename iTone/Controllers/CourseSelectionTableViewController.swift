//
//  CourseSelectionTableViewController.swift
//  iTone
//
//  Created by Jerry Lu on 7/14/17.
//  Copyright © 2017 Jerry Lu. All rights reserved.
//

import UIKit

class CourseSelectionTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1.0)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func unwindToCourseSelectionTableViewController(_ segue: UIStoryboardSegue) {
    }
}
