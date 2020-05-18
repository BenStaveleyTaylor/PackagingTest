//
//  Person.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

// A model of https://swapi.dev/api/people/schema

public struct CorePerson: Codable {

    let name: String
    let height: String
    let mass: String
    let hairColor: String            // JSON: hair_color
    let skinColor: String            // JSON: skin_color
    let eyeColor: String            // JSON: eye_color
    let birthYear: String            // JSON: birth_year
    let gender: String
    let homeworld: URL?
    let films: [URL]?
    let planets: [URL]?
    let starships: [URL]?
    let vehicles: [URL]?
    let species: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CorePerson: Fetchable {
    static var subPath = "people"
}
