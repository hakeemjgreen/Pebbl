//
//  FeedViewController.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/10/22.
//

import Foundation
import UIKit

class FeedViewController : UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        self.tabBarController?.navigationItem.title = "Your title goes here"

        
        print("LOADED")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        // Create Tab one
        let tabOne = UINavigationController(rootViewController: ViewController1())
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = ViewController2()
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab two
        let tabThree = ViewController3()
        let tabTwoBarItem3 = UITabBarItem(title: "Tab 3", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabThree.tabBarItem = tabTwoBarItem3
        
        // Create Tab two
        let tabFour = ViewController4()
        let tabTwoBarItem4 = UITabBarItem(title: "Tab 4", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabFour.tabBarItem = tabTwoBarItem4
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    class ViewController1: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()

            self.navigationItem.title = "Timeline"
//            self.navigationController?.view.backgroundColor = .red
            navigationController?.navigationBar.prefersLargeTitles = true

        }
    }
    class ViewController2: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
//            view.backgroundColor = .blue
        }
    }
    class ViewController3: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
//            view.backgroundColor = .yellow
        }
    }
    class ViewController4: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
//            view.backgroundColor = .green
        }
    }
}
