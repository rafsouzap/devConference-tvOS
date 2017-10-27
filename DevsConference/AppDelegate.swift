//
//  AppDelegate.swift
//  DevsConference
//
//  Created by Rafael Paula on 27/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
	
	var window: UIWindow?
	var tvAppController: TVApplicationController?
	
	static let serverBaseUrl = "http://localhost:9001"
	static let serverBootUrl = AppDelegate.serverBaseUrl.appending("/js/app.js")
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		
		let tvAppContext = TVApplicationControllerContext()
		
		guard let javaScriptAppURL = URL(string: AppDelegate.serverBootUrl) else {
			fatalError("Unable to create URL with ServerBootURL")
		}
		
		tvAppContext.javaScriptApplicationURL = javaScriptAppURL
		tvAppContext.launchOptions["BASE_URL"] = AppDelegate.serverBaseUrl
		
		tvAppController = TVApplicationController(context: tvAppContext, window: window, delegate: self)
		
		return true
	}
	
	func applicationWillResignActive(_ application: UIApplication) { }
	
	func applicationDidEnterBackground(_ application: UIApplication) { }
	
	func applicationWillEnterForeground(_ application: UIApplication) { }
	
	func applicationDidBecomeActive(_ application: UIApplication) { }
	
	func applicationWillTerminate(_ application: UIApplication) { }
}
