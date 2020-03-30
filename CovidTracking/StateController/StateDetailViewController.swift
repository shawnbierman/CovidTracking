//
//  StateDetailViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/28/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class StateDetailViewController: UIViewController {
    
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var stateCaptionLabel: UILabel!
    @IBOutlet weak var stateDeathsLabel: UILabel!
    
    var state: State?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state,
            let stateName = statesDictionary[state.state],
            let stateNegative = state.negative?.formatNumber(with: .decimal),
            let statePositive = state.positive?.formatNumber(with: .decimal),
            let stateTotal = state.totalTestResults?.formatNumber(with: .decimal) {
            
            let stateCaptionLabelString = "With a reported \(stateTotal) persons tested, \(stateName) has \(statePositive) postitive cases and \(stateNegative) negative."
            
            stateNameLabel.text = stateName.uppercased()
            stateCaptionLabel.text = stateCaptionLabelString
            
            if let deaths = state.death?.formatNumber(with: .decimal) {
                stateDeathsLabel.text = "There have been a total of \(deaths) deaths."
            } else {
                stateDeathsLabel.text = ""
            }
            
        } else {
            stateCaptionLabel.text = "Information for this region is incomplete at this time."
            stateDeathsLabel.text = ""
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

public extension Int {
    func formatNumber(with style: NumberFormatter.Style) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = style
        
        if let formatted = numberFormatter.string(from: NSNumber(value: self)) {
            return formatted
        } else {
            return nil
        }
    }
}
