//
//  CoreStarship.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 18/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

// A model of https://swapi.dev/api/starships/schema

public struct CoreStarship: Codable {

    public let name: String
    public let model: String
    public let manufacturer: String
    public let costInCredits: String            // JSON: cost_in_credits
    public let length: String
    public let maxAtmospheringSpeed: String     // JSON: max_atmosphering_speed
    public let crew: String
    public let passengers: String
    public let cargoCapacity: String           // JSON: cargo_capacity
    public let consumables: String
    public let hyperdriveRating: String        // JSON: hyperdrive_rating
    public let MGLT: String
    public let starshipClass: String           // JSON: starship_class
    public let pilots: [URL]?
    public let films: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CoreStarship: Fetchable {
    static var subPath = "starships"
}
