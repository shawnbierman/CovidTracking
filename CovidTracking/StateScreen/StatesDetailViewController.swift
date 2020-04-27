//
//  StatesDetailViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/26/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class StatesDetailViewController: UIViewController {

    let content = ContentViewController()
    
    var state: State?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        add(content)
        set()
    }

    
    func set() {
        
        let total = state!
        let totalResults = total.totalTestResults?.formatNumber(as: .decimal) ?? "unknown"
        let positives = total.positive?.formatNumber(as: .decimal) ?? "unknown"
        let deaths = total.death?.formatNumber(as: .decimal) ?? "unknown"
        
        let body = "The U.S. has currently tested a total of \(totalResults) persons with a total of \(positives) positive results."
        
        DispatchQueue.main.async {
            self.content.headerLabel.text = statesDictionary[self.state!.state]?.uppercased()
            self.content.bodyLabel.text = body
            self.content.footerLabel.text = "There have been \(deaths) deaths in total."
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
}
