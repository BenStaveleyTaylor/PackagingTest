//
//  Species.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 18/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

// A model of https://swapi.dev/api/species/schema

public struct CoreSpecies: Codable {

    public let name: String
    public let classification: String
    public let designation: String
    public let averageHeight: String            // JSON: average_height
    public let averageLifespan: String            // JSON: average_lifespan
    public let hairColors: String            // JSON: hair_colors
    public let skinColors: String            // JSON: skin_colors
    public let eyeColors: String            // JSON: eye_colors
    public let homeworld: URL?
    public let language: String
    public let people: [URL]?
    public let films: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CoreSpecies: Fetchable {
    static var subPath = "species"
}
