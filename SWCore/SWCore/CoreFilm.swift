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

    let title: String
    let episodeId: Int                  // JSON: episode_id
    let openingCrawl: String            // JSON: opening_crawl
    let director: String
    let producer: String
    let releaseDate: Date               // JSON: release_date
    let characters: [URL]?
    let planets: [URL]?
    let starships: [URL]?
    let vehicles: [URL]?
    let species: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CoreFilm: Fetchable {
    static var subPath = "films"
}
