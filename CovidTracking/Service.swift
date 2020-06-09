//
//  Service.swift
//  CovidTracking
//
//  Created by Shawn Bierman on 3/22/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import Foundation
import os.log

enum Endpoint: String {
    case states
    case press
    case us
}

class Service {

    static let shared = Service() // singleton
    
    private let baseURLString = "https://covidtracking.com/api/v1/"

    // MARK: - Available apis
    
    /// The fetch suite is used to retrieve information from a supplied end point and will return the result
    /// to the completion handler.
    /// - Parameters:
    ///   - endpoint: The Endpoint Type is a type safe enum that provides your fetch API's enpoint.
    ///   - completion: The completion handler will take a custom model and return with the Result Type.
    
    func fetchAllStates(using endpoint: Endpoint, completion: @escaping (Result<[State], Error>) -> Void) {
        fetchJSONDecodableData(endpoint: endpoint, completion: completion)
    }

    /// The fetch suite is used to retrieve information from a supplied end point and will return the result
    /// to the completion handler.
    /// - Parameters:
    ///   - endpoint: The Endpoint Type is a type safe enum that provides your fetch API's enpoint.
    ///   - completion: The completion handler will take a custom model and return with the Result Type.
    
    func fetchAllArticles(using endpoint: Endpoint, completion: @escaping (Result<[Article], Error>) -> Void) {
        fetchJSONDecodableData(endpoint: endpoint, completion: completion)
    }

    /// The fetch suite is used to retrieve information from a supplied end point and will return the result
    /// to the completion handler.
    /// - Parameters:
    ///   - endpoint: The Endpoint Type is a type safe enum that provides your fetch API's enpoint.
    ///   - completion: The completion handler will take a custom model and return with the Result Type.
    
    func fetchTotals(using endpoint: Endpoint, completion: @escaping (Result<[Total], Error>) -> Void) {
        fetchJSONDecodableData(endpoint: endpoint, completion: completion)
    }
    
    // MARK: - Session and decode
    /// A URLSession task that will fetch the given endpoint. It will return to the Result type a success or failure for the given generic model.
    /// - Parameters:
    ///   - endpoint: The Endpoint Type is a type safe enum that provides your fetch API's enpoint.
    ///   - completion: The completion handler will take a custom model and return with the Result Type.
    
    private func fetchJSONDecodableData<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {

        let baseUrlString = baseURLString.appending(endpoint.rawValue).appending("/current.json")

        os_log("%{PUBLIC}@", log: .networking, type: .info, baseUrlString)
        
        let url = URL(string: baseUrlString)
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
}
