//
//  NetSalaryViewController.swift
//  DestinationTracker
//
//  Created by Group12 on 10/3/17.
//  Copyright © 2017 Alixa Bahena. All rights reserved.
//

import UIKit
class NetSalaryViewController: UIViewController {
    
    @IBOutlet var netSalaryLabel: UILabel!
    var netSalary: Double = 0
    
    override func viewDidLoad() {
        netSalaryLabel.text = ""
        func gatherData() {
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //netSalary = totalSalary - totalExpense
    }
    
    
}
