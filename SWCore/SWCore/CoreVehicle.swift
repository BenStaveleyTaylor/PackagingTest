//
//  CoreVehicle.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 18/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

// A model of https://swapi.dev/api/vehicles/schema

public struct CoreVehicle: Codable {

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
    public let vehicleClass: String        // JSON: vehicle_class
    public let pilots: [URL]?
    public let films: [URL]?
    // Not modelling: created
    // Not modelling: edited
    // Not modelling: url
}

extension CoreVehicle: Fetchable {
    static var subPath = "vehicles"
}
