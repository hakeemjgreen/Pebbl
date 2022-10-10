//
//  AppDelegate.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/6/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
//        window?.backgroundColor = .systemBackground
        window?.backgroundColor = .white
//        window?.tintColor  = .black
//        navigationController.pushViewController(ViewController(coder: NSCoder())!,animated: true)
        
        //Uncomment for root
//        navigationController.pushViewController(OnBoardingHomeController(), animated: true)
//                window?.rootViewController = navigationController
        
        
                window?.rootViewController = FeedViewController()
//        window?.backgroundColor = .white
        return true
    }
}

