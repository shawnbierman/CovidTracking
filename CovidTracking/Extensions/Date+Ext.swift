//
//  Date+Ext.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 4/26/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation

extension Date {
    
    func formatISO8601Date(from string: String) -> String? {
        
        // format ISO8601 date
        //        let dateString = "2020-03-29T23:00:00Z"
        //        let df = ISO8601DateFormatter()
        //        df.date(from: dateString) // Optional(2020-03-29 23:00:00 +0000)
        
        let df = DateFormatter()
        guard let date = ISO8601DateFormatter().date(from: string) else { return nil }
        return df.string(from: date)
        
    }
    
    func formatDate(from string: String) -> String? {
        
        // format ISO8601 date
        //        let dateString = "2020-03-29T23:00:00Z"
        //        let df = ISO8601DateFormatter()
        //        df.date(from: dateString) // Optional(2020-03-29 23:00:00 +0000)
        
        let formatterInput = DateFormatter()
        formatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let formatterOutput = DateFormatter()
        formatterOutput.dateFormat = "MMMM d, yyyy hh:mm a"
        
        if let date = formatterInput.date(from: string) {
            return formatterOutput.string(from: date)
        } else {
            return nil
        }
    }
    
}
