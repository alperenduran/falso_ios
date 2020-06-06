//
//  Service.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import Combine
import Foundation

class PodcastStore: ObservableObject {
    @Published var podcast: [Podcast] = []
    func fetchPodcasts() {
        let endpoint = URL(string: "http://www.falso.co/api/podcast/getEpisodes")
        guard let url = endpoint else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                let data = try! JSONDecoder().decode(PodcastResponse.self, from: data!)
                self.podcast = data.items
            }
        }.resume()
    }
}
