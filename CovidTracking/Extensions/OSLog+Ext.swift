//
//  OSLog+Ext.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 5/7/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation
import os.log

extension OSLog {
    
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    /// Logs the view cycles like viewDidLoad.
    static let viewCycle  = OSLog(subsystem: subsystem, category: "viewcycle")
    
    /// Logs network fetch events
    static let networking = OSLog(subsystem: subsystem, category: "network")
    
}
