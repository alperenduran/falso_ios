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
    @Published var errorMessage = ""
    @Published var showError = false
    func fetchBlogs(
        completion: @escaping (
        Result<[Blog], Error>
        )
        -> Void
    ) {
        let url = URL(string: "http://www.falso.co/api/medium/getStories")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let data = try JSONDecoder().decode(BlogResponse.self, from: data!)
                let blogs = data.items
                completion(.success(blogs))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    
    init() {
        fetchBlogs() { resp in
            if case .success(let blogs) = resp {
                self.blogs = blogs
            } else if case .failure(let error) = resp {
                self.errorMessage = error.localizedDescription
                self.showError = true
            }
        }
    }
}
