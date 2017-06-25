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
    static let lastAccessTime = "LastAccessTime"
    static let lastTipIndexKey = "LastTipIndex"
    static let lastBillValue = "LastBill"
    static let timeIntervalToRestoreLastState = 60 * 10
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var billContainerView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var billFieldModified = false
    
    @IBOutlet weak var plusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.placeholder = getCurrencyFormattedText(0.00)
        let defaults = UserDefaults.standard
        let lastAccessTime = defaults.integer(forKey: Constants.lastAccessTime)
        var tipIndex = defaults.integer(forKey: Constants.defaultTipIndexKey)
        if (shouldRememberPreviousState(lastAccessTime)) {
            tipIndex = defaults.integer(forKey: Constants.lastTipIndexKey)
            let bill = defaults.string(forKey: Constants.lastBillValue)
            billField.text = bill
            if (billField.text != "") {
                billTextChanged(self)
            }
        }
        tipControl.selectedSegmentIndex = tipIndex
        billField.becomeFirstResponder()
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
            revealTipAndTotalViews()
        }
        billFieldModified = true
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: Constants.lastBillValue)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nsString = textField.text as NSString?
        if let newString = nsString?.replacingCharacters(in: range, with: string) {
            let newNumberOfDecimals = newString.components(separatedBy: ".").count - 1
            return newNumberOfDecimals <= 1
        } else {
            return true;
        }
    }
    
    private func revealTipAndTotalViews() {
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
    
    private func shouldRememberPreviousState(_ lastAccessTime: Int) -> Bool {
        let currentTime = Int(Date().timeIntervalSince1970)
        return currentTime - lastAccessTime < Constants.timeIntervalToRestoreLastState
    }
    
    private func calculateTip() {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Constants.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = getCurrencyFormattedText(tip)
        totalLabel.text = getCurrencyFormattedText(total)
        UserDefaults.standard.set(tipControl.selectedSegmentIndex, forKey: Constants.lastTipIndexKey)
    }
    
    private func getCurrencyFormattedText(_ amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: amount as NSNumber)!
    }
}

