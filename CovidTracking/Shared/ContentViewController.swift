//
//  ContentViewController.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

struct Content {
    let headerText: String
    let bodyText: String
    let footerText: String
    let citationText: String
    let regionImage: UIImage?
}

class ContentViewController: UIViewController {
    
    let headerLabel   = UILabel()
    let bodyLabel     = UILabel()
    let footerLabel   = UILabel()
    let citationLabel = UILabel()
    let regionImage   = UIImageView()

    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
        set()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set() {
        headerLabel.text = "The Covid Tracking Project".uppercased()
        citationLabel.text = "All data collected from covidtracking.com"
        regionImage.image = UIImage(named: "Tennessee")
    }
  
    
    fileprivate func configureLayout() {
        
        let views = [headerLabel, bodyLabel, footerLabel, regionImage, citationLabel]
        
        for view in views {
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        headerLabel.font = UIFont(name: "DIN Condensed", size: 75)
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.textAlignment = .center
        headerLabel.textColor = .secondaryLabel
        headerLabel.minimumScaleFactor = 0.2
        
        bodyLabel.numberOfLines = 0
        bodyLabel.font = .preferredFont(forTextStyle: .body)
        bodyLabel.textAlignment = .justified
        
        footerLabel.font = .preferredFont(forTextStyle: .subheadline)
        footerLabel.textAlignment = .center
        footerLabel.textColor = .secondaryLabel
        
        regionImage.contentMode = .scaleAspectFit
        
        citationLabel.font = .preferredFont(forTextStyle: .caption2)
        citationLabel.textAlignment = .center
        citationLabel.textColor = .tertiaryLabel
        
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerLabel.heightAnchor.constraint(equalToConstant: 85),
            
            bodyLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            footerLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 30),
            footerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            footerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            regionImage.topAnchor.constraint(equalTo: footerLabel.bottomAnchor, constant: 20),
            regionImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            regionImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            regionImage.heightAnchor.constraint(equalToConstant: 200),
            
            citationLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            citationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            citationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            citationLabel.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
}