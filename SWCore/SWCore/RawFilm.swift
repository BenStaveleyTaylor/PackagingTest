//
//  RawFilm.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

public struct RawFilm: Codable {

    let title: String
    let episodeId: Int                  // JSON: episode_id
    let openingCrawl: String            // JSON: opening_crawl
    let director: String
    let producer: String
    let releaseDate: Date               // JSON: release_date
    let characters: [URL]
    let planets: [URL]
    let starships: [URL]
    let vehicles: [URL]
    let species: [URL]
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension RawFilm: Fetchable {
    static var subPath = "films"
}



/*
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
 */

