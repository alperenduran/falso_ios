//
//  TodayModels.swift
//  falso_ios
//
//  Created by Alperen Duran on 2.07.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import Foundation

struct TodayResponse: Codable {
    let matchs: [Match]
}

struct Match: Codable, Identifiable {
    let id = UUID()
    let homeTeam: String
    let homeLogo: URL
    let awayTeam: String
    let awayLogo: URL
    let time: String
}
