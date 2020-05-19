//
//  Starship.swift
//  SWEngineering
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// A filtered version of the CoreVehicle object with
// references to people, species and planets removed
public struct Starship {

    public let name: String
    public let model: String
    public let manufacturer: String
    public let costInCredits: String
    public let length: String
    public let maxAtmospheringSpeed: String
    public let crew: String
    public let passengers: String
    public let cargoCapacity: String
    public let consumables: String
    public let hyperdriveRating: String
    public let MGLT: String
    public let starshipClass: String

    // Instead of URLs that the Core object has, we just keep a list of IDs.
    public let films: [Identifier]?


    init(coreStarship: CoreStarship) {

        // Copy across allowed fields
        self.name = coreStarship.name
        self.model = coreStarship.model
        self.manufacturer = coreStarship.manufacturer
        self.costInCredits = coreStarship.costInCredits
        self.length = coreStarship.length
        self.maxAtmospheringSpeed = coreStarship.maxAtmospheringSpeed
        self.crew = coreStarship.crew
        self.passengers = coreStarship.passengers
        self.cargoCapacity = coreStarship.cargoCapacity
        self.consumables = coreStarship.consumables
        self.hyperdriveRating = coreStarship.hyperdriveRating
        self.MGLT = coreStarship.MGLT
        self.starshipClass = coreStarship.starshipClass

        // Eliminate the URLs; present an API of just IDs.
        self.films = Utils.identifiers(links: coreStarship.films)
    }
}
