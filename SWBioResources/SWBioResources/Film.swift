//
//  Film.swift
//  SWEngineering
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// A filtered version of the CoreFilm object with
// references to Vehicle and Starship objects removed
public struct Film {

    public let title: String
    public let episodeId: Int
    public let openingCrawl: String
    public let director: String
    public let producer: String
    public let releaseDate: Date

    // Instead of URLs that the Core object has, we just keep a list of IDs.
    public let characters: [Identifier]?
    public let planets: [Identifier]?
    public let species: [Identifier]?

    init(coreFilm: CoreFilm) {

        // Copy across allowed fields
        self.title = coreFilm.title
        self.episodeId = coreFilm.episodeId
        self.openingCrawl = coreFilm.openingCrawl
        self.director = coreFilm.director
        self.producer = coreFilm.producer
        self.releaseDate = coreFilm.releaseDate

        // Eliminate the URLs; present an API of just IDs.
        self.characters = Utils.identifiers(links: coreFilm.characters)
        self.planets = Utils.identifiers(links: coreFilm.planets)
        self.species = Utils.identifiers(links: coreFilm.species)
    }
}
