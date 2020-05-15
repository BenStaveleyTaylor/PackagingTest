//
//  Api.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

public struct Api {

    let network: Network

    init(baseUrl: URL = URL(string: "https://swapi.dev/api")!) {
        self.network = Network(baseUrl: baseUrl)
    }

    //    func films(completion: @escaping (Result<[Film], Error>) -> Void) {
//
//        Network().fetch(group: Film.path) { result in
//
//            switch result {
//            case .success(let json):
//                let films: [Film] = Utils.listObjects(json: json)
//                completion(.success(films))
//
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }

    func film(id: Identifier, completion: @escaping (Result<RawFilm, Error>) -> Void) {

        self.network.fetch(item: id) { result in
            completion(result)
        }
    }

    func countFilms(completion: @escaping (Result<Int, Error>) -> Void) {

        self.network.count(subPath: RawFilm.subPath) { result in
            completion(result)
        }
    }

}
