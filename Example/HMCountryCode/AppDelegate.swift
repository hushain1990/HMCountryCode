//
//  AppDelegate.swift
//  HMCountryCode
//
//  Created by hushain1990 on 05/10/2024.
//  Copyright (c) 2024 hushain1990. All rights reserved.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var mainController: UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        mainController = UIHostingController(rootView: ExampleView())
        window?.rootViewController = mainController
        window?.makeKeyAndVisible()
        
        return true
    }

}

