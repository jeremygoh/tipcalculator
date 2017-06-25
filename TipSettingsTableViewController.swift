//
//  TipSettingsTableViewController.swift
//  Tip Calculator
//
//  Created by me on 6/24/17.
//  Copyright © 2017 Jeremy Goh. All rights reserved.
//

import UIKit

class TipSettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: Constants.defaultTipIndexKey)
        let defaultRowIndexPath = IndexPath(row: defaultTipIndex, section: 0)
        self.tableView.selectRow(at: defaultRowIndexPath, animated: false, scrollPosition: UITableViewScrollPosition.middle)
        self.tableView(self.tableView, didSelectRowAt: defaultRowIndexPath)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.tipPercentages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tipDefaultCell", for: indexPath)
        cell.textLabel!.text = TipSettingsTableViewController.doubleToPercentageString(Constants.tipPercentages[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at:indexPath) {
            cell.accessoryType = .checkmark
            let defaults = UserDefaults.standard
            defaults.set(indexPath.row, forKey: Constants.defaultTipIndexKey)
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    static func doubleToPercentageString(_ percentage: Double) -> String {
        return String(format: "%d %%", Int(percentage * 100))
    }

}
