//
//  ArticleTableViewCell.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/26/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        textLabel?.numberOfLines    = 0
        textLabel?.font             = UIFont.preferredFont(forTextStyle: .headline)
        detailTextLabel?.textColor  = .secondaryLabel
        detailTextLabel?.font       = UIFont.preferredFont(forTextStyle: .subheadline)
        accessoryType               = .disclosureIndicator
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with result: Article) {
        textLabel?.text = result.title ?? "Title not found"
        detailTextLabel?.text = result.publication ?? result.author ?? "Unkown author"
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        textLabel?.text = nil
        detailTextLabel?.text = nil
        imageView?.image = nil
        
    }
}
