//
//  ViewController.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/6/22.
//

import UIKit

class OnBoardingHomeController: UIViewController {

    var pageViewController = UIPageViewController()
    var pages = [UIViewController]()
    let label = UILabel()
    var currentVC = UIViewController()
    var pageControl = UIPageControl()
    var currIndex = 0
    let loginButton = UIButton()
    let loginViewController = LoginViewController()
    let signupButton = UIButton()
        
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pages.append(OnboardingViewController(titleText: "Page 1", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "))
        
        pages.append(OnboardingViewController(titleText: "Page 2", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "))
                        
        pages.append(OnboardingViewController(titleText: "Page 3", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "))
        //Set first page as currentVC
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
//        pageControl.subviews.forEach {
//            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeViews() //Must be called first or will be overlayed and buttons won't work
        setupPageControl()
        setup()
    }
    
    //Adds views in stack
    func initializeViews(){
        //Add child view controller to parent view controller
        addChild(pageViewController)
        view.addSubview(pageViewController.view) //Add child view to subview
    }
    
    func setupPageControl() {
        
        pageViewController.didMove(toParent: self) //
        
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.height-162,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = pages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.lightGray
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
                
        loginButton.frame = CGRect(x: 0, y: 0, width: (view.frame.width/2)-60, height: 50)
        loginButton.frame.origin.x = loginButton.frame.width+80
        loginButton.frame.origin.y = self.view.frame.height-loginButton.frame.height-60
        loginButton.backgroundColor = .black
        loginButton.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        loginButton.setTitle("Log in", for: .normal)
        
        signupButton.frame = CGRect(x: 0, y: 0, width: (view.frame.width/2)-60, height: 50)
        signupButton.frame.origin.x = signupButton.frame.width-96
        signupButton.frame.origin.y = self.view.frame.height-signupButton.frame.height-60
        signupButton.backgroundColor = .black
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.addTarget(self, action: #selector(signupClick), for: .touchUpInside)

        view.addSubview(signupButton)
        view.addSubview(loginButton)
        view.addSubview(pageControl)
        
        view.backgroundColor = .white
    }
    
    @objc func loginClick(_ sender: UIButton){
        print("Login")
        self.navigationController?.popViewController(animated: false)
//        self.present(loginViewController, animated:true, completion:nil)
        self.navigationController?.pushViewController(loginViewController,animated: true)

    }
    
    @objc func signupClick(){
        print("Signup")
    }
    
    private func setup(){

        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
//            description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            pageViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
  
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        currentVC = pages.first!
    }


}
extension OnBoardingHomeController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool){
        
        if (!completed)
          {
            return
          }
        if let currentViewController = pageViewController.viewControllers?.first,
           let index = pages.firstIndex(of: currentViewController) {
            currIndex = index
        }
//        print(currIndex)
        pageControl.currentPage = currIndex
    }
}
extension OnBoardingHomeController: UIPageViewControllerDataSource{
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
//        return pages.count
        return 0
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return pages.firstIndex(of: self.currentVC) ?? 0
        return 0
    }
    
}
