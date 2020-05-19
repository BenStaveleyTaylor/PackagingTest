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

    public let name: String
    public let height: String
    public let mass: String
    public let hairColor: String            // JSON: hair_color
    public let skinColor: String            // JSON: skin_color
    public let eyeColor: String            // JSON: eye_color
    public let birthYear: String            // JSON: birth_year
    public let gender: String
    public let homeworld: URL?
    public let films: [URL]?
    public let starships: [URL]?
    public let vehicles: [URL]?
    public let species: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CorePerson: Fetchable {
    static var subPath = "people"
}
