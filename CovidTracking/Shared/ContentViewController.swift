//
//  ContentViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    let headerLabel   = UILabel()
    let dividerView   = UIView()
    let bodyLabel     = UILabel()
    let footerLabel   = UILabel()
    let citationLabel = UILabel()

    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    init(with state: State) {
        super.init(nibName: nil, bundle: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureComponents()
        configureLayout()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    
    fileprivate func configureComponents() {
        
        headerLabel.text = "The Covid Tracking Project".uppercased()
        headerLabel.font = UIFont(name: "DINCondensed-Bold", size: 75)
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.textAlignment = .center
        headerLabel.textColor = .secondaryLabel
        headerLabel.minimumScaleFactor = 0.2
        
        dividerView.backgroundColor = .secondaryLabel
        dividerView.layer.opacity   = 0.5
        
        bodyLabel.numberOfLines = 0
        bodyLabel.font = .preferredFont(forTextStyle: .body)
        bodyLabel.textAlignment = .left
        bodyLabel.adjustsFontSizeToFitWidth = true
        
        footerLabel.font = .preferredFont(forTextStyle: .subheadline)
        footerLabel.textAlignment = .center
        footerLabel.adjustsFontSizeToFitWidth = true
        
        citationLabel.text = "All data collected from covidtracking.com"
        citationLabel.font = .preferredFont(forTextStyle: .caption1)
        citationLabel.adjustsFontSizeToFitWidth = true
        citationLabel.textAlignment = .center
        citationLabel.textColor = .tertiaryLabel
        citationLabel.lineBreakMode = .byTruncatingMiddle
        
    }
    
    
    fileprivate func configureLayout() {
        
        let views = [headerLabel, dividerView, bodyLabel, footerLabel, citationLabel]
        
        for view in views {
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerLabel.heightAnchor.constraint(equalToConstant: 85),
            
            dividerView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -160),
            dividerView.heightAnchor.constraint(equalToConstant: 0.7),
            
            bodyLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 40),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            footerLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 30),
            footerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            footerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            citationLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            citationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            citationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            citationLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}
