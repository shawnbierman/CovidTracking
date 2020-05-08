//
//  StatesTableViewCell.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/26/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class StatesTableViewCell: UITableViewCell {

    // init() runs only when the viewcontroller first appears and will only run
    // for enough cells to fill the screen. subsequent appearences
    // are dequeued/reused cells.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.font             = UIFont.preferredFont(forTextStyle: .headline)
        detailTextLabel?.font       = UIFont.preferredFont(forTextStyle: .subheadline)
        detailTextLabel?.textColor  = .secondaryLabel
        accessoryType               = .disclosureIndicator
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // runs everytime cell is drawn on screen
    func configure(with state: State) {
        
        textLabel?.text = state.fullStateName
        detailTextLabel?.text = state.positive?.formatNumber(as: .decimal) ?? "0"
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        textLabel?.text = nil
        detailTextLabel?.text = nil
        imageView?.image = nil
        
    }
}
