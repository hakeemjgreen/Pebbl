//
//  FeedViewController.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/10/22.
//

import Foundation
import UIKit

class FeedViewController : UITabBarController{
    let navColor = UIColor(red: 66/255, green: 66/255, blue: 195/255,
                           alpha: 1)
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Feed"
//
//        print("LOADED")
//    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        // Create Tab one
        let tabOne = UINavigationController(rootViewController: ViewController1())
//        let tabOne = ViewController1()
//        let dsxfcd = UITabBarController.setViewControllers(ViewController1)
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two
        let tabTwo = ViewController2()
        let tabTwoBarItem2 = UITabBarItem(title: "Notifications", image: UIImage(named: "notification.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem2
        
        // Create Tab two
        let tabThree = ViewController3()
        let tabTwoBarItem3 = UITabBarItem(title: "Profile", image: UIImage(named: "user.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabThree.tabBarItem = tabTwoBarItem3
        
        // Create Tab two
//        let tabFour = ViewController4()
//        let tabTwoBarItem4 = UITabBarItem(title: "Tab 4", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
//
//        tabFour.tabBarItem = tabTwoBarItem4
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree]
        
        
        UITabBar.appearance().tintColor = navColor // New!!

    }
}
class ViewController1: UIViewController {
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    var characters = ["Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna","Link", "Zelda", "Ganondorf", "Midna",]
    override func viewDidLoad() {
            super.viewDidLoad()
//
            self.navigationItem.title = "Timeline"
////            UINavigationBar.appearance().tintColor = UIColor.red
////            self.navigationController?.view.backgroundColor = .red
////            self.navigationController?.navigationItem.tin = .red
            let navColor = UIColor(red: 66/255, green: 66/255, blue: 195/255, alpha: 1)
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: navColor]
////            navigationController?.navigationBar.barStyle = .black
//
            navigationController?.navigationBar.prefersLargeTitles = true
//
//            self.view.backgroundColor = .green
    }
    override func loadView() {
        
        super.loadView()
        
        safeArea = view.layoutMarginsGuide
        setupTableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
      }
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      }
}

extension ViewController1: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 50
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = characters[indexPath.row]
      
    return cell
  }
    
    
}
extension ViewController1: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("row: \(indexPath.row)")
//        self.present(ViewController2(), animated: false)
        self.navigationController?.pushViewController(Page(), animated: true)

    }
}
class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
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
