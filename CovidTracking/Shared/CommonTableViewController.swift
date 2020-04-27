//
//  CommonTableViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/27/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class CommonTableViewController: UITableViewController {

    let cellReuseIdentifier = "cell"
    
    
    func configureRefreshControl(with selector: Selector) {
        
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl?.addTarget(self, action: selector, for: .valueChanged)
        
    }
}
