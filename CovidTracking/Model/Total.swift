//
//  Total.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/29/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation

struct Total: Codable {
    let positive, negative, death, totalTestResults: Int
    let lastModified: String
}
