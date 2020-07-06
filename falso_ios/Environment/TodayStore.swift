//
//  TodayStore.swift
//  falso_ios
//
//  Created by Alperen Duran on 2.07.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import Foundation
import Combine

class TodayStore: ObservableObject {
    @Published var matchs: [Match] = []
    @Published var errorMessage = ""
    @Published var showError = false
    func fetchMatchs(
        completion: @escaping (
        Result<[Match], Error>
        )
        -> Void
    ) {
        let url = URL(string: "http://www.falso.co/api/getToday")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let data = try JSONDecoder().decode(TodayResponse.self, from: data!)
                let matchs = data.matchs
                completion(.success(matchs))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    
    init() {
        fetchMatchs { resp in
            DispatchQueue.main.async {
                if case .success(let matchs) = resp {
                    self.matchs = matchs
                } else if case .failure(let error) = resp {
                    self.errorMessage = error.localizedDescription
                    self.showError = true
                }
            }
        }
    }
}

