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
    
    @IBOutlet weak var billContainerView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var billFieldModified = false
    
    @IBOutlet weak var plusLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex = defaults.integer(forKey: Constants.defaultTipIndexKey)
        billField.becomeFirstResponder()
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
        calculateTip()
    }

    @IBAction func billTextChanged(_ sender: Any) {
        calculateTip()
        if !billFieldModified {
            let navigationBar = self.navigationController!.navigationBar
            let verticalHeightAvailable = view.frame.height - navigationBar.frame.height
            UIView.animate(withDuration: 0.2, animations: {
                self.billContainerView.frame = CGRect(x: 0, y: navigationBar.frame.origin.y + navigationBar.frame.size.height, width: self.view.frame.width, height: verticalHeightAvailable * 0.35)
                self.billField.frame = CGRect(x: 0, y: self.billContainerView.frame.origin.y, width: self.billField.frame.width, height: verticalHeightAvailable * 0.1)
                self.tipControl.frame = CGRect(x: self.tipControl.frame.origin.x, y: self.billField.frame.origin.y + self.billField.frame.height + 20, width: self.tipControl.frame.width, height: self.tipControl.frame.height)
                self.totalLabel.isHidden = false
                self.tipControl.isHidden = false
                self.tipLabel.isHidden = false
                self.plusLabel.isHidden = false
            })
            
        }
        billFieldModified = true
    }
    
    private func calculateTip() {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Constants.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

