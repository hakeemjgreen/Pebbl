//
//  ViewController.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/6/22.
//

import UIKit

class ViewController: UIViewController {

    var pageViewController = UIPageViewController()
    var pages = [UIViewController]()
    let label = UILabel()
    var currentVC = UIViewController()
    let pageControl = UIPageControl()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pages.append(ViewController1())
        pages.append(ViewController2())
                        
        //Set first page as currentVC
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        view.backgroundColor = .red
        
        setup()
    }
    
    private func setup(){
//        view.backgroundColor = UIColor(hex: "#f6f6f6")
//        pageViewController.view.translatesAutoresizingMaskIntoConstraints = true //Setup for autolayout
        
        
        //Add child view controller to parent view controller
        addChild(pageViewController)
        view.addSubview(pageViewController.view) //Add child view to subview
        pageViewController.didMove(toParent: self) //
        
        let proxy = UIPageControl.appearance()
        proxy.pageIndicatorTintColor = .gray
        proxy.currentPageIndicatorTintColor = .black
        proxy.contentMode = .left

        pageViewController.dataSource = self
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
//            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
    }


}
extension ViewController: UIPageViewControllerDataSource{
    //View controller before swipe
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    //View controller after swipe
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    //Prevents scrolling past the rightmost view vontroller
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    //Prevents scrolling past the leftmost view vontroller
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
    
}
class ViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .systemRed
        
        let title = UILabel()
        title.text = "PAGE 1"
        view.addSubview(title)
        let description = UILabel()
        
        view.addSubview(description)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        
        description.text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        description.translatesAutoresizingMaskIntoConstraints = false
        description.numberOfLines = 0
        description.textColor = UIColor(hex: "#ffffff")
        description.setLineHeight(lineHeight: 10)
        
        
        NSLayoutConstraint.activate([
            
//            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            title.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
            title.bottomAnchor.constraint(equalTo: description.topAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            
//            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            description.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: -400),
            description.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            description.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
        ])
    }
}

class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemGreen
    }
}

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemBlue
    }
}
