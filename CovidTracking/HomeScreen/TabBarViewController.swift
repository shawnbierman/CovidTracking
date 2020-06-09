//
//  TabBarViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = createViewControllers()
    }
    
    
    fileprivate func createViewControllers() -> [UIViewController] {
        
        let homeVC = HomeViewController()
            homeVC.tabBarItem = createTabBarItem(titled: "Home", using: "house")
        
        let statesVC = StatesTableViewController()
            statesVC.title = "States"
            statesVC.tabBarItem = createTabBarItem(titled: "State Reports", using: "map")
        
        return [homeVC, UINavigationController(rootViewController: statesVC)]
    }
    
    
    fileprivate func createTabBarItem(titled title: String, using systemName: String) -> UITabBarItem {
        
        return UITabBarItem(title: title,
                            image: UIImage(systemName: systemName),
                            selectedImage: UIImage(systemName: "\(systemName).fill"))
    }
}
