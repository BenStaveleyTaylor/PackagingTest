//
//  Vehicle.swift
//  SWEngineering
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation
import SWCore

// A filtered version of the CoreVehicle object with
// references to people, species and planets removed
public struct Vehicle {

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
    public let vehicleClass: String

    // Instead of URLs that the Core object has, we just keep a list of IDs.
    public let films: [Identifier]?


    init(coreVehicle: CoreVehicle) {

        // Copy across allowed fields
        self.name = coreVehicle.name
        self.model = coreVehicle.model
        self.manufacturer = coreVehicle.manufacturer
        self.costInCredits = coreVehicle.costInCredits
        self.length = coreVehicle.length
        self.maxAtmospheringSpeed = coreVehicle.maxAtmospheringSpeed
        self.crew = coreVehicle.crew
        self.passengers = coreVehicle.passengers
        self.cargoCapacity = coreVehicle.cargoCapacity
        self.consumables = coreVehicle.consumables
        self.vehicleClass = coreVehicle.vehicleClass

        // Eliminate the URLs; present an API of just IDs.
        self.films = Utils.identifiers(links: coreVehicle.films)
    }
}
