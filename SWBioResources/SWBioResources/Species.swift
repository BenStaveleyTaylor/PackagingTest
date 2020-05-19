//
//  Species.swift
//  SWBioResources
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// A filtered version of the CoreSpecies object with
// references to Vehicle and Starship objects removed
public struct Species {

    public let name: String
    public let classification: String
    public let designation: String
    public let averageHeight: String
    public let averageLifespan: String
    public let hairColors: String
    public let skinColors: String
    public let eyeColors: String
    public let homeworld: Identifier?
    public let language: String

    // Instead of URLs that the Core object has, we just keep a list of IDs.
    public let people: [Identifier]?
    public let films: [Identifier]?

    init(coreSpecies: CoreSpecies) {

        // Copy across allowed fields
        self.name = coreSpecies.name
        self.classification = coreSpecies.classification
        self.designation = coreSpecies.designation
        self.averageHeight = coreSpecies.averageHeight
        self.averageLifespan = coreSpecies.averageLifespan
        self.hairColors = coreSpecies.hairColors
        self.skinColors = coreSpecies.skinColors
        self.eyeColors = coreSpecies.eyeColors
        self.homeworld = Int(coreSpecies.homeworld?.lastPathComponent ?? "")
        self.language = coreSpecies.language

        // Eliminate the URLs; present an API of just IDs.
        self.people = Utils.identifiers(links: coreSpecies.people)
        self.films = Utils.identifiers(links: coreSpecies.films)
    }
}
