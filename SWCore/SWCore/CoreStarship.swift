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

    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String            // JSON: cost_in_credits
    let length: String
    let maxAtmospheringSpeed: String     // JSON: max_atmosphering_speed
    let crew: String
    let passengers: String
    let cargoCapacity: String           // JSON: cargo_capacity
    let consumables: String
    let hyperdriveRating: String        // JSON: hyperdrive_rating
    let MGLT: String
    let starshipClass: String           // JSON: starship_class
    let pilots: [URL]?
    let films: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CoreStarship: Fetchable {
    static var subPath = "starships"
}
