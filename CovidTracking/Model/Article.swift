//
//  Article.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/25/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation

enum Language: String, Codable {
    case en = "EN"
    case es = "ES"
    case fr = "FR"
    case it = "IT"
    case pt = "PT"
}

enum UsesCovidTrackingData: String, Codable {
    case no = "no"
    case purpleYes = "yes "
    case usesCovidTrackingDataYes = "Yes"
    case yes = "yes"
}

struct Article: Codable {
    var title,
        url,
        dataSource,
        publishDate,
        publication,
        author: String?
    var addToCovidTrackingProjectWebsite,
        featureOnCovidTrackingProjectHomepage,
        continuallyUpdated,
        aboutCovidTrackingProject,
        doesThisSourceHaveADataVisualization: Bool?
    var usesCovidTrackingData: UsesCovidTrackingData?
    var language: Language?
}
