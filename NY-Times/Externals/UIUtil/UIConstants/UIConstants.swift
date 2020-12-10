//
//  UIConstants.swift
//  NY-Times
//
//  Created by Hadeer Kamel on 12/10/20.
//

import UIKit

class UIConstants{
    private init() {
    }
    static var RootViewController: UIViewController {
        get{
            return  UINavigationController(rootViewController:  ArticlesVC())
        }
    }
    
    struct Colors {
        static var AppMainColor = #colorLiteral(red: 0.2355992496, green: 0.8859558702, blue: 0.7561911941, alpha: 1)
    }
    
    static func setupNavigationBar(){
        UINavigationBar.appearance().backgroundColor = UIConstants.Colors.AppMainColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = UIConstants.Colors.AppMainColor
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }
}
