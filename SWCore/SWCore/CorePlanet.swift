//
//  Planet.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 18/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

// A model of https://swapi.dev/api/planets/schema

public struct CorePlanet: Codable {

    let name: String
    let rotationPeriod: String           // JSON: rotation_period
    let orbitalPeriod: String           // JSON: orbital_period
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String            // JSON: surface_water
    let population: String
    let residents:  [URL]?
    let films: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CorePlanet: Fetchable {
    static var subPath = "planets"
}
