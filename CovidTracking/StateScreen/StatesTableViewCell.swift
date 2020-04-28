//
//  StatesTableViewCell.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/26/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class StatesTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        detailTextLabel?.textColor = .secondaryLabel
        accessoryType = .disclosureIndicator
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with state: State) {
        
        textLabel?.text = statesDictionary[state.state]
        detailTextLabel?.text = state.positive?.formatNumber(as: .decimal) ?? "0"
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        textLabel?.text = nil
        detailTextLabel?.text = nil
        imageView?.image = nil
        
    }
}
