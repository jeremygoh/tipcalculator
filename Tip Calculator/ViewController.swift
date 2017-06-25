//
//  ViewController.swift
//  Tip Calculator
//
//  Created by me on 6/24/17.
//  Copyright © 2017 Jeremy Goh. All rights reserved.
//

import UIKit

struct Constants {
    static let tipPercentages = [0.15, 0.18, 0.20]
    static let defaultTipIndexKey = "DefaultTipIndex"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: Constants.defaultTipIndexKey)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }

    @IBAction func tipPercentChanged(_ sender: Any) {
        calculateTip(sender: sender)
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Constants.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

