//
//  CoreFilm.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

// A model of https://swapi.dev/api/films/schema

public struct CoreFilm: Codable {

    public let title: String
    public let episodeId: Int                  // JSON: episode_id
    public let openingCrawl: String            // JSON: opening_crawl
    public let director: String
    public let producer: String
    public let releaseDate: Date               // JSON: release_date
    public let characters: [URL]?
    public let planets: [URL]?
    public let starships: [URL]?
    public let vehicles: [URL]?
    public let species: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CoreFilm: Fetchable {
    static var subPath = "films"
}
