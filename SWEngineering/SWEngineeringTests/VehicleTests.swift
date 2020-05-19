//
//  VehicleTests.swift
//  SWEngineeringTests
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
import SWEngineering

class VehicleTests: XCTestCase {

    var api: SWEngineering.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWEngineering.Api(baseUrl: testServer)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.api = nil
    }

    func testCountVehicles() throws {

        let expectation = self.expectation(description: #function)

        self.api.countVehicles() { result in

            switch result {
            case .success(let count):
                XCTAssertEqual(count, 39)
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }


    func testFetchVehicle() throws {

        let expectation = self.expectation(description: #function)

        // Result of: https://swapi.dev/api/vehicles/14/

        self.api.vehicle(id: 14) { result in

            switch result {
            case .success(let vehicle):
                XCTAssertEqual(vehicle.name, "Snowspeeder")
                XCTAssertEqual(vehicle.manufacturer, "Incom corporation")
                XCTAssertEqual(vehicle.maxAtmospheringSpeed, "650")
                XCTAssertEqual(vehicle.consumables, "none")
                XCTAssertTrue(vehicle.films?.contains(2) ?? false)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
