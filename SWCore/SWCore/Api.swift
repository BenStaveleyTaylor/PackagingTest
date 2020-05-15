//
//  Api.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

public struct Api {

    func films(completion: @escaping (Result<[Film], Error>) -> Void) {

        Network().fetch(group: Film.path) { result in

            switch result {
            case .success(let json):
                let films: [Film] = Utils.listObjects(json: json)
                completion(.success(films))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
