//
//  AppDelegate.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootViewController: UINavigationController?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootVC()
        setupCoreData()
        return true
    }
}
