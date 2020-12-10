//
//  AppDelegate.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setRootViewController()
        UIConstants.setupNavigationBar()
        return true
    }
    
     private func setRootViewController(){
        DispatchQueue.main.async {
            self.window = UIWindow(frame:UIScreen.main.bounds)
            self.window?.rootViewController = UIConstants.RootViewController
            self.window?.makeKeyAndVisible()
            
        }
    }
    

}

