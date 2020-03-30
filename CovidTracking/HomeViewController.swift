//
//  HomeViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/29/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

//    let positive, negative, death, totalTestResults: Int
//    let lastModified: String

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var infoTotalsLabel: UILabel!
    @IBOutlet weak var deathsTotalLabel: UILabel!
    @IBOutlet weak var websiteInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshData()
        websiteInfoLabel.text = "All data collected from covidtracking.com"
    }
    
    fileprivate func refreshData() {
        Service.shared.fetchTotals(api: "https://covidtracking.com/api/us") { [weak self] (result) in
            
            switch result {
                
            case .failure(let error):
                dump(error)
                
            case .success(let model):
                
                let total = model[0]
                let totalResults = total.totalTestResults.formatNumber(with: .decimal) ?? "unknown"
                let positives = total.positive.formatNumber(with: .decimal) ?? "unknown"
                let deaths = total.death.formatNumber(with: .decimal) ?? "unknown"
                
                let body = "The US has currently tested a total of \(totalResults) persons with a total of \(positives) positive results."
                
                DispatchQueue.main.async {
                    self?.infoTotalsLabel.text = body
                    self?.deathsTotalLabel.text = "There have been \(deaths) deaths in total."
                }
            }
        }
    }
}
