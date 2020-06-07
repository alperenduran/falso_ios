//
//  BlogModels.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import Foundation

struct BlogResponse: Codable {
    let items: [Blog]
}

struct Blog: Codable, Identifiable {
    let id = UUID()
    let creator: String
    let title: String
    let link: URL
    let pubDate: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case creator
        case title
        case link
        case pubDate
        case content = "content:encoded"
    }
}
