//
//  Api.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

// Retrieve objects provided by https://swapi.dev
// See https://swapi.dev/api/

public struct Api {

    let network: Network

    public init(baseUrl: URL = URL(string: "https://swapi.dev/api")!) {
        self.network = Network(baseUrl: baseUrl)
    }

    public func countFilms(completion: @escaping (Result<Int, Error>) -> Void) {

        self.network.count(subPath: CoreFilm.subPath) { result in
            completion(result)
        }
    }

    public func film(id: Identifier, completion: @escaping (Result<CoreFilm, Error>) -> Void) {

        self.network.fetch(item: id) { result in
            completion(result)
        }
    }

    public func countPeople(completion: @escaping (Result<Int, Error>) -> Void) {

        self.network.count(subPath: CorePerson.subPath) { result in
            completion(result)
        }
    }

    public func person(id: Identifier, completion: @escaping (Result<CorePerson, Error>) -> Void) {

        self.network.fetch(item: id) { result in
            completion(result)
        }
    }

    public func countPlanets(completion: @escaping (Result<Int, Error>) -> Void) {

        self.network.count(subPath: CorePlanet.subPath) { result in
            completion(result)
        }
    }

    public func planet(id: Identifier, completion: @escaping (Result<CorePlanet, Error>) -> Void) {

        self.network.fetch(item: id) { result in
            completion(result)
        }
    }

    public func countSpecies(completion: @escaping (Result<Int, Error>) -> Void) {

        self.network.count(subPath: CoreSpecies.subPath) { result in
            completion(result)
        }
    }

    public func species(id: Identifier, completion: @escaping (Result<CoreSpecies, Error>) -> Void) {

        self.network.fetch(item: id) { result in
            completion(result)
        }
    }

    public func countStarships(completion: @escaping (Result<Int, Error>) -> Void) {

        self.network.count(subPath: CoreStarship.subPath) { result in
            completion(result)
        }
    }

    public func starship(id: Identifier, completion: @escaping (Result<CoreStarship, Error>) -> Void) {

        self.network.fetch(item: id) { result in
            completion(result)
        }
    }

    public func countVehicles(completion: @escaping (Result<Int, Error>) -> Void) {

        self.network.count(subPath: CoreVehicle.subPath) { result in
            completion(result)
        }
    }

    public func vehicle(id: Identifier, completion: @escaping (Result<CoreVehicle, Error>) -> Void) {

        self.network.fetch(item: id) { result in
            completion(result)
        }
    }

}
