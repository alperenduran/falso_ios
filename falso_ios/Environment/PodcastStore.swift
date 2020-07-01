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
    @Published var podcasts: [Podcast] = []
    @Published var errorMessage = ""
    @Published var showError = false
    func fetchPodcasts(
        completion: @escaping (
        Result<[Podcast], Error>
        )
        -> Void
    ) {
        let url = URL(string: "http://www.falso.co/api/podcast/getEpisodes")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let data = try JSONDecoder().decode(PodcastResponse.self, from: data!)
                let podcasts = data.items
                completion(.success(podcasts))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    
    init() {
        fetchPodcasts() { resp in
            if case .success(let podcasts) = resp {
                self.podcasts = podcasts
            } else if case .failure(let error) = resp {
                self.errorMessage = error.localizedDescription
                self.showError = true
            }
        }
    }
}
