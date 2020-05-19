//
//  Planet.swift
//  SWBioResources
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// A filtered version of the CorePlanet object with
// references to Vehicle and Starship objects removed
public struct Planet {

    public let name: String
    public let rotationPeriod: String
    public let orbitalPeriod: String
    public let diameter: String
    public let climate: String
    public let gravity: String
    public let terrain: String
    public let surfaceWater: String
    public let population: String

    // Instead of URLs that the Core object has, we just keep a list of IDs.
    public let films: [Identifier]?
    public let residents: [Identifier]?

    init(corePlanet: CorePlanet) {

        // Copy across allowed fields
        self.name = corePlanet.name
        self.rotationPeriod = corePlanet.rotationPeriod
        self.orbitalPeriod = corePlanet.orbitalPeriod
        self.diameter = corePlanet.diameter
        self.climate = corePlanet.climate
        self.gravity = corePlanet.gravity
        self.terrain = corePlanet.terrain
        self.surfaceWater = corePlanet.surfaceWater
        self.population = corePlanet.population

        // Eliminate the URLs; present an API of just IDs.
        self.films = Utils.identifiers(links: corePlanet.films)
        self.residents = Utils.identifiers(links: corePlanet.residents)
    }
}
