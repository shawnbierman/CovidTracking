//
//  StatesCell.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 5/8/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class StatesCell: UITableViewCell {
    
    var headlineLabel: UILabel = {
        let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .headline)
            label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var subHeadlineLabel: UILabel = {
       let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .subheadline)
            label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        layoutComponents()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        headlineLabel.text  = nil
        subHeadlineLabel.text = nil
        
    }
    
    
    func populateComponents(with state: State) {
        
        headlineLabel.text = state.fullStateName
        subHeadlineLabel.text = state.positive?.formatNumber(as: .decimal) ?? "0"
        
    }
    
    
    func layoutComponents() {
        
        let views = [headlineLabel, subHeadlineLabel]
        views.forEach(self.addSubview)
        
        NSLayoutConstraint.activate([
            
            headlineLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            headlineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headlineLabel.heightAnchor.constraint(equalToConstant: 50),
            
            subHeadlineLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor),
            subHeadlineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            subHeadlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            subHeadlineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
