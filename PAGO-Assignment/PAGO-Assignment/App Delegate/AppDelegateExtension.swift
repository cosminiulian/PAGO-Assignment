//
//  AppDelegateExtension.swift
//  PAGO-Assignment
//
//  Created by Cosmin Iulian on 26.07.2022.
//

import UIKit

extension AppDelegate {
    
    func setupRootVC() {
        rootViewController = UINavigationController(rootViewController: ContactsViewController())
        rootViewController?.setNavigationBarHidden(true, animated: false)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func setupCoreData() {
        CoreDataManager.shared.load()
    }
}
