//
//  AppDelegate.swift
//  IRSOryctest
//
//  Created by Ingrid Silapan on 20/04/18.
//  Copyright © 2018 irs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		configureAppearance()
		
		return true
	}

	private func configureAppearance() {
		
		let darkGray = UIColor(red:0.15, green:0.16, blue:0.16, alpha:1.0)
		let blueGreen = UIColor(red:0.12, green:0.65, blue:0.65, alpha:1.0)
		
		UINavigationBar.appearance().barTintColor = darkGray
		UINavigationBar.appearance().tintColor = blueGreen
		
		UIButton.appearance().tintColor = blueGreen
		
		UITableView.appearance().backgroundColor = darkGray
		
		
		
	}


}

