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
        navigationController.navigationBar.backgroundColor = .white
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.prefersLargeTitles = true
        let mainVC = MainVC()
        navigationController.viewControllers = [mainVC]
        self.window?.rootViewController = navigationController
        navigationController.navigationItem.largeTitleDisplayMode = .automatic
        self.window?.makeKeyAndVisible()
        return true
    }
}

