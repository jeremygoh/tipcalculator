//
//  AppDelegate.swift
//  Tip Calculator
//
//  Created by me on 6/24/17.
//  Copyright © 2017 Jeremy Goh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let defaults = UserDefaults.standard
        defaults.set(Int(Date().timeIntervalSince1970), forKey: Constants.lastAccessTime)
    }
}

