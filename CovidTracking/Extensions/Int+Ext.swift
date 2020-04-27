//
//  Int+Ext.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/26/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation

public extension Int {
    
    func formatNumber(as style: NumberFormatter.Style) -> String? {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = style
        
        if let formatted = numberFormatter.string(from: NSNumber(value: self)) {
            return formatted
        } else {
            return nil
        }
    }
}
