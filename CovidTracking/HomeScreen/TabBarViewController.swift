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
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = createTabBarItem(titled: "Home", using: "house")
        
        let articlesTableViewController = ArticlesTableViewController()
        articlesTableViewController.title = "Articles"
        articlesTableViewController.tabBarItem = createTabBarItem(titled: "Articles", using: "doc")
        
        let statesViewController = StatesViewController()
        statesViewController.title = "States"
        statesViewController.tabBarItem = createTabBarItem(titled: "State Reports", using: "map")
        
        return [homeViewController,
                UINavigationController(rootViewController: articlesTableViewController),
                UINavigationController(rootViewController: statesViewController)]
    }
    
    
    fileprivate func createTabBarItem(titled title: String, using systemName: String) -> UITabBarItem {
        
        return UITabBarItem(title: title,
                            image: UIImage(systemName: systemName),
                            selectedImage: UIImage(systemName: "\(systemName).fill"))
    }
}
