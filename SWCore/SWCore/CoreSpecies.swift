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

    let name: String
    let classification: String
    let designation: String
    let averageHeight: String            // JSON: average_height
    let averageLifespan: String            // JSON: average_lifespan
    let hairColors: String            // JSON: hair_colors
    let skinColors: String            // JSON: skin_colors
    let eyeColors: String            // JSON: eye_colors
    let homeworld: URL?
    let language: String
    let people: [URL]?
    let films: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CoreSpecies: Fetchable {
    static var subPath = "species"
}
