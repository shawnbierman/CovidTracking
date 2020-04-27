//
//  CommonLayout.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    let headerLabel   = UILabel()
    let bodyLabel     = UILabel()
    let footerLabel   = UILabel()
    let citationLabel = UILabel()

    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func configureLayout() {
        
        let views = [headerLabel, bodyLabel, footerLabel, citationLabel]
        
        for view in views {
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        
        headerLabel.font = UIFont(name: "DIN Condensed Bold", size: 75)
        headerLabel.textAlignment = .center
        headerLabel.textColor = .secondaryLabel
        headerLabel.minimumScaleFactor = 0.5
        
        bodyLabel.numberOfLines = 0
        bodyLabel.font = .preferredFont(forTextStyle: .body)
        
        footerLabel.numberOfLines = 1
        footerLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        citationLabel.numberOfLines = 1
        citationLabel.font = .preferredFont(forTextStyle: .caption2)

        
        NSLayoutConstraint.activate([
            
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerLabel.heightAnchor.constraint(equalToConstant: 85),
            
            bodyLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            footerLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 30),
            footerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            footerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            
        ])
    }
}
