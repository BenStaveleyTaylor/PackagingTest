//
//  Api.swift
//  SWEngineering
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// Engineering interface to https://swapi.dev
// This means you can only access Vehicle, Starship and Film objects.
// References to People, Species and Planet objects are sanitised out.

// See https://swapi.dev/api/

public struct Api {

    let coreApi: SWCore.Api

    public init(baseUrl: URL = URL(string: "https://swapi.dev/api")!) {
        self.coreApi = SWCore.Api(baseUrl: baseUrl)
    }

    public func countFilms(completion: @escaping (Result<Int, Error>) -> Void) {
        self.coreApi.countFilms(completion: completion)
     }

    public func film(id: Identifier, completion: @escaping (Result<Film, Error>) -> Void) {

        self.coreApi.film(id: id) { result in

            let processedResult = result.map { coreFilm in
                Film(coreFilm: coreFilm)
            }

            completion(processedResult)
        }
    }

    public func countStarships(completion: @escaping (Result<Int, Error>) -> Void) {
        self.coreApi.countStarships(completion: completion)
    }

    public func starship(id: Identifier, completion: @escaping (Result<Starship, Error>) -> Void) {

        self.coreApi.starship(id: id) { result in

            let processedResult = result.map { coreStarship in
                Starship(coreStarship: coreStarship)
            }

            completion(processedResult)
        }
    }

    public func countVehicles(completion: @escaping (Result<Int, Error>) -> Void) {
        self.coreApi.countVehicles(completion: completion)
    }

    public func vehicle(id: Identifier, completion: @escaping (Result<Vehicle, Error>) -> Void) {

        self.coreApi.vehicle(id: id) { result in

            let processedResult = result.map { coreVehicle in
                Vehicle(coreVehicle: coreVehicle)
            }

            completion(processedResult)
        }
    }
}
