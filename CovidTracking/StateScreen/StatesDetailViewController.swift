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

    init(state: State) {
        super.init(nibName: nil, bundle: nil)
        self.state = state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set() {
        
        guard let state = state else { return }
        
        let totalResults = state.totalTestResults?.formatNumber(as: .decimal) ?? "unknown"
        let positives = state.positive?.formatNumber(as: .decimal) ?? "unknown"
        let deaths = state.death?.formatNumber(as: .decimal) ?? "unknown"
        let dateModified = formatDate(from: state.dateModified)
        let stateName = statesDictionary[state.state] ?? "unknown"
        let body = "\(stateName) has currently tested a total of \(totalResults) persons with a total of \(positives) positive results."
        
        DispatchQueue.main.async {
            self.content.headerLabel.text = statesDictionary[self.state!.state]?.uppercased()
            self.content.bodyLabel.text = body
            self.content.footerLabel.text = "There have been \(deaths) deaths in total."
            self.content.citationLabel.text = "Last modified: \(dateModified ?? "unknown")"
        }
        
    }
    
    
    func formatDate(from input: String) -> String? {
        
        let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = df.date(from: input) {
            
            let outFormat = DateFormatter()
                outFormat.dateStyle = .long
                outFormat.timeStyle = .medium
            
            return outFormat.string(from: date)
            
        }
        
        return nil
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
