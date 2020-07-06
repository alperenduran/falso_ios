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
    
    var cssContent: String {
        """
        <style>
            h1 {
                font-size: 60pt;
                font-weight: bold;
                font-style: normal;
                font-family: sans-serif;
            }
        
            h2 {
                font-size: 55pt;
                font-weight: bold;
                font-style: normal;
                font-family: sans-serif;
            }
        
            h3 {
                font-size: 50pt;
                font-weight: bold;
                font-style: normal;
                font-family: sans-serif;
            }

            p {
                font-size: 24pt;
                font-weight: normal;
                font-style: normal;
                font-family: sans-serif;
            }

            img {
                border-radius: 10px;
                max-width: 100%;
                height: auto;
            }
        
            blockquote {
                font-size: 20pt;
                font-weight: normal;
                font-style: italic;
                font-family: sans-serif;
            }
        </style>
        \(content)
        """
    }
}
