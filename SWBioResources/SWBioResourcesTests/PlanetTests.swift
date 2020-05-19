//
//  PlanetTests.swift
//  SWBioResourcesTests
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
import SWBioResources

class PlanetTests: XCTestCase {

    var api: SWBioResources.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWBioResources.Api(baseUrl: testServer)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.api = nil
    }

    func testCountPlanets() throws {

        let expectation = self.expectation(description: #function)

        self.api.countPlanets() { result in

            switch result {
            case .success(let count):
                XCTAssertEqual(count, 60)
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }


    func testFetchPlanet() throws {

        let expectation = self.expectation(description: #function)

        // Result of: https://swapi.dev/api/planets/1

        self.api.planet(id: 1) { result in

            switch result {
            case .success(let planet):
                XCTAssertEqual(planet.name, "Tatooine")
                XCTAssertEqual(planet.rotationPeriod, "23")
                XCTAssertEqual(planet.gravity, "1 standard")
                XCTAssertEqual(planet.surfaceWater, "1")
                XCTAssertTrue(planet.films?.contains(6) ?? false)
                XCTAssertTrue(planet.residents?.contains(4) ?? false)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
