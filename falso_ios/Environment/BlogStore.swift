//
//  BlogStore.swift
//  falso_ios
//
//  Created by Alperen Duran on 6.06.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import Foundation
import Combine

class BlogStore: ObservableObject {
    @Published var blogs: [Blog] = []
    func fetchPodcasts() {
        let endpoint = URL(string: "http://www.falso.co/api/medium/getStories")
        guard let url = endpoint else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                let data = try! JSONDecoder().decode(BlogResponse.self, from: data!)
                self.blogs = data.items
            }
        }.resume()
    }
}
