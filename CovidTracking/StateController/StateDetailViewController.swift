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
    @IBOutlet weak var dateModifiedLabel: UILabel!
    
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
            
            if let formattedDate = formatDate(from: state.dateModified) {
                dateModifiedLabel.text = "Last modified: \(formattedDate)"
            } else {
                dateModifiedLabel.text = "No date information available."
            }
            
            if let deaths = state.death?.formatNumber(with: .decimal) {
                stateDeathsLabel.text = "There have been a total of \(deaths) deaths."
            } else {
                stateDeathsLabel.text = ""
            }
            
        } else {
            if let state = state, let stateName = statesDictionary[state.state] {
                stateNameLabel.text = stateName.uppercased()
                stateCaptionLabel.text = "Information for this region is incomplete at this time."
                stateDeathsLabel.text = ""
            }
            
        }
        
    }
    
    func formatISO8601Date(from string: String) -> String? {
        
        // format ISO8601 date
        //        let dateString = "2020-03-29T23:00:00Z"
        //        let df = ISO8601DateFormatter()
        //        df.date(from: dateString) // Optional(2020-03-29 23:00:00 +0000)
        
        let df = DateFormatter()
        guard let date = ISO8601DateFormatter().date(from: string) else { return nil }
        return df.string(from: date)
        
    }
    
    func formatDate(from string: String) -> String? {
        
        // format ISO8601 date
//        let dateString = "2020-03-29T23:00:00Z"
//        let df = ISO8601DateFormatter()
//        df.date(from: dateString) // Optional(2020-03-29 23:00:00 +0000)
        
        let formatterInput = DateFormatter()
        formatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let formatterOutput = DateFormatter()
        formatterOutput.dateFormat = "MMMM d, yyyy hh:mm a"
        
        if let date = formatterInput.date(from: string) {
            return formatterOutput.string(from: date)
        } else {
            return nil
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
