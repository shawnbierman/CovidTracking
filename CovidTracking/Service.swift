//
//  Service.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/22/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation

class Service {

    static let shared = Service() // singleton

    // MARK: - Available apis
    /// You must supply a model for each API and an optional authorization string if required.

    func fetchAllStates(api: String, completion: @escaping (Result<[State], Error>) -> Void) {
        fetchJSONDecodableData(query: api, authorization: nil, completion: completion)
    }

    func fetchAllArticles(api: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        fetchJSONDecodableData(query: api, authorization: nil, completion: completion)
    }

    func fetchTotals(api: String, completion: @escaping (Result<[Total], Error>) -> Void) {
        fetchJSONDecodableData(query: api, authorization: nil, completion: completion)
    }
    
    // MARK: - Session and decode
    private func fetchJSONDecodableData<T: Decodable>(query: String, authorization: String?, completion: @escaping (Result<T, Error>) -> Void) {

        dump(query)

        let url = URL(string: query)
        let task = URLSession.shared.dataTask(with: url!) { (data, _, error) in

            guard error == nil else { return }
            guard let data = data else { return }

            do {
                let objects = try JSONDecoder().decode(T.self, from: data)
                completion(.success(objects))
            } catch let error {
                completion(.failure(error))
            }
        }

        task.resume()

    }

    private func buildURLRequest(query: String, authorization: String?) -> URLRequest? {

        let body = ["query": query]
        let urlString = "https://covidtracking.com/api/graphql"
        let url = URL(string: urlString)

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        if let authorization = authorization {
            request.addValue("Bearer " + authorization, forHTTPHeaderField: "Authorization")
        }

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch let error {
            dump(error.localizedDescription)
            return nil
        }

        return request
    }
}
