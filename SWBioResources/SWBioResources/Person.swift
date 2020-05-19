//
//  Person.swift
//  SWBioResources
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// A filtered version of the CorePerson object with
// references to Vehicle and Starship objects removed
public struct Person {

    public let name: String
    public let height: String
    public let mass: String
    public let hairColor: String
    public let skinColor: String
    public let eyeColor: String
    public let birthYear: String
    public let gender: String
    public let homeworld: Identifier?        // planet identifier

    // Instead of URLs that the Core object has, we just keep a list of IDs.
    public let films: [Identifier]?
    public let species: [Identifier]?

    init(corePerson: CorePerson) {

        // Copy across allowed fields
        self.name = corePerson.name
        self.height = corePerson.height
        self.mass = corePerson.mass
        self.hairColor = corePerson.hairColor
        self.skinColor = corePerson.skinColor
        self.eyeColor = corePerson.eyeColor
        self.birthYear = corePerson.birthYear
        self.gender = corePerson.gender
        self.homeworld = Int(corePerson.homeworld?.lastPathComponent ?? "")

        // Eliminate the URLs; present an API of just IDs.
        self.films = Utils.identifiers(links: corePerson.films)
        self.species = Utils.identifiers(links: corePerson.species)
    }
}
