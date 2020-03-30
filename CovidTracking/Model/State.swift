//
//  State.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/22/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation

enum Grade: String, Codable {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
}

struct State: Codable {
    let state: String
    let positive, totalTestResults, negative, death: Int?
    let dateModified, dateChecked: String
}
