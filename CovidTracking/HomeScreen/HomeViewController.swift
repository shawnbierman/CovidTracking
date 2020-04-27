//
//  HomeViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/29/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let content = ContentViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        add(content)
        refreshData()

    }
    

    fileprivate func refreshData() {
        
        Service.shared.fetchTotals(using: .us) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .failure(let error):
                dump(error)
                
            case .success(let model):
                
                let total = model.first!
                let totalResults = total.totalTestResults.formatNumber(as: .decimal) ?? "unknown"
                let positives = total.positive.formatNumber(as: .decimal) ?? "unknown"
                let deaths = total.death.formatNumber(as: .decimal) ?? "unknown"
                
                let body = "The U.S. has currently tested a total of \(totalResults) persons with a total of \(positives) positive results."
                
                DispatchQueue.main.async {
                    self.content.bodyLabel.text = body
                    self.content.footerLabel.text = "There have been \(deaths) deaths in total."
                }
            }
        }
    }
}
