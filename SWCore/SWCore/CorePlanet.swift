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

    public let name: String
    public let rotationPeriod: String           // JSON: rotation_period
    public let orbitalPeriod: String           // JSON: orbital_period
    public let diameter: String
    public let climate: String
    public let gravity: String
    public let terrain: String
    public let surfaceWater: String            // JSON: surface_water
    public let population: String
    public let residents:  [URL]?
    public let films: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CorePlanet: Fetchable {
    static var subPath = "planets"
}
