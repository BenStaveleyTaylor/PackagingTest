//
//  Films.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

public struct RawFilm {

    static let path = "films"

    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: Date
    let characters: Identifiers
    let planets: Identifiers
    let starships: Identifiers
    let vehicles: Identifiers
    let species: Identifiers

    init(json: JsonObject) {

        self.title = json["title"] as? String ?? ""
        self.episode_id = json["episode_id"] as? Int ?? 0
        self.opening_crawl = json["opening_crawl"] as? String ?? ""
        self.director = json["director"] as? String ?? ""
        self.producer = json["producer"] as? String ?? ""

        var date: Date?
        if let yyyymmdd = json["release_date"] as? String {
            date = Utils.date(yyyymmdd: yyyymmdd)
        }
        self.release_date = date ?? Date(timeIntervalSinceReferenceDate: 0)

        var characterIds: [Identifier]?
        if let characterLinks = json["characters"] as? [String] {
            characterIds = Utils.identifiers(links: characterLinks)
        }
        self.characters = characterIds ?? []

        var planetIds: [Identifier]?
        if let planetLinks = json["planets"] as? [String] {
            planetIds = Utils.identifiers(links: planetLinks)
        }
        self.planets = planetIds ?? []

        var starshipIds: [Identifier]?
        if let starshipLinks = json["starships"] as? [String] {
            starshipIds = Utils.identifiers(links: starshipLinks)
        }
        self.starships = starshipIds ?? []

        var vehicleIds: [Identifier]?
        if let vehicleLinks = json["vehicles"] as? [String] {
            vehicleIds = Utils.identifiers(links: vehicleLinks)
        }
        self.vehicles = vehicleIds ?? []

        var speciesIds: [Identifier]?
        if let speciesLinks = json["species"] as? [String] {
            speciesIds = Utils.identifiers(links: speciesLinks)
        }
        self.species = speciesIds ?? []
    }
}
