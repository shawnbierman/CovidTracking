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
    
    
    func configure(with result: Article) {
        textLabel?.text = result.title ?? "Title not found"
        detailTextLabel?.text = result.author ?? result.publication ?? "Unkown author"
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        textLabel?.text = nil
        detailTextLabel?.text = nil
        imageView?.image = nil
        
    }
}
