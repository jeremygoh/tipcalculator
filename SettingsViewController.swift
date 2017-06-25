//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by me on 6/24/17.
//  Copyright © 2017 Jeremy Goh. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: Constants.defaultTipIndexKey)
        let defaultTip = Constants.tipPercentages[defaultTipIndex]
        defaultTipLabel.text = TipSettingsTableViewController.doubleToPercentageString(defaultTip)
    }
}
