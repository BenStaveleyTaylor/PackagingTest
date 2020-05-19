//
//  Api.swift
//  SWBioResources
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// BioResources interface to https://swapi.dev
// This means you can only access Person, Species, Planet and Film objects.
// References to Vehicle and Starship objects are sanitised out.

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

    public func countPeople(completion: @escaping (Result<Int, Error>) -> Void) {
        self.coreApi.countPeople(completion: completion)
     }

    public func person(id: Identifier, completion: @escaping (Result<Person, Error>) -> Void) {

        self.coreApi.person(id: id) { result in

            let processedResult = result.map { corePerson in
                Person(corePerson: corePerson)
            }

            completion(processedResult)
        }
    }

    public func countPlanets(completion: @escaping (Result<Int, Error>) -> Void) {
        self.coreApi.countPlanets(completion: completion)
    }

    public func planet(id: Identifier, completion: @escaping (Result<Planet, Error>) -> Void) {

        self.coreApi.planet(id: id) { result in

            let processedResult = result.map { corePlanet in
                Planet(corePlanet: corePlanet)
            }

            completion(processedResult)
        }
    }

    public func countSpecies(completion: @escaping (Result<Int, Error>) -> Void) {
        self.coreApi.countSpecies(completion: completion)
    }

    public func species(id: Identifier, completion: @escaping (Result<Species, Error>) -> Void) {

        self.coreApi.species(id: id) { result in

            let processedResult = result.map { coreSpecies in
                Species(coreSpecies: coreSpecies)
            }

            completion(processedResult)
        }
    }
}
