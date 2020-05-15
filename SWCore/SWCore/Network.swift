//
//  Network.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

typealias JsonObject = [String: Any]

internal struct Network {

    let baseUrl: URL! = URL(string: "https://swapi.dev/api")

    func fetch(group: String, item: Identifier? = nil, completion: @escaping (Result<JsonObject, Error>) -> Void) {

        var fullUrl = baseUrl.appendingPathComponent(group)
        if let item = item {
            fullUrl = fullUrl.appendingPathComponent(String(item))
        }
        let request = URLRequest(url: fullUrl)

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in

            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []),
                let object = json as? JsonObject {
                completion(.success(object))
            }
            else {
                completion(.failure(error ?? URLError(.unknown)))
            }
        }.resume()
    }
}
