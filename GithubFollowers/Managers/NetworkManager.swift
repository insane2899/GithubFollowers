//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Soumik Sen on 25/07/24.
//

import Foundation

class NetworkManager {
    let baseURL = "https://api.github.com/users/"
    static let shared = NetworkManager()

    private init() {}

    func getFollowers(for username: String, page: Int, completed: @escaping ((Result<[Follower], GFError>) -> Void)) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                //If there is server error then it will be in response. This error is present mostly if there is connection error
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
        
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
        
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        //This is what starts the network call
        task.resume()
    }
}
