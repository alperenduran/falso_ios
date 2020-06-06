//
//  PodcastModels.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import Foundation

struct PodcastResponse: Codable {
    let items: [Podcast]
}

struct Podcast: Codable, Identifiable {
    let id = UUID()
    let title: String
    let pubDate: String
    let enclosure: Enclosure
    let contentSnippet: String
    let itunes: iTunesInfo
}

struct Enclosure: Codable {
    let url: URL
}

struct iTunesInfo: Codable {
    let image: URL
}

extension Podcast {
    var podcastURL: URL {
        enclosure.url
    }
    
    var image: URL {
        itunes.image
    }
}
