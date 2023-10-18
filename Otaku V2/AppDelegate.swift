//
//  AppDelegate.swift
//  Otaku V2
//
//  Created by The WORLD on 04.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        navigationController.navigationBar.backgroundColor = UIColor(named: "background")
        navigationController.view.backgroundColor = UIColor(named: "background")
        navigationController.navigationBar.prefersLargeTitles = true
//        navigationController.navigationBar.tintColor = UIColor(named: "barItemColor")
        let mainVC = MainVC()
        navigationController.viewControllers = [mainVC]
        self.window?.rootViewController = navigationController
        navigationController.navigationItem.largeTitleDisplayMode = .automatic
        self.window?.makeKeyAndVisible()
        return true
    }
}

