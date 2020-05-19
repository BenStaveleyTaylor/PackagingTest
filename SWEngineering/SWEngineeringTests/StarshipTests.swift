//
//  StarshipTests.swift
//  SWEngineeringTests
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
import SWEngineering

class StarshipTests: XCTestCase {

    var api: SWEngineering.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWEngineering.Api(baseUrl: testServer)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.api = nil
    }

    func testCountStarships() throws {

        let expectation = self.expectation(description: #function)

        self.api.countStarships() { result in

            switch result {
            case .success(let count):
                XCTAssertEqual(count, 36)
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }


    func testFetchStarship() throws {

        let expectation = self.expectation(description: #function)

        // Result of: https://swapi.dev/api/starships/5/

        self.api.starship(id: 5) { result in

            switch result {
            case .success(let starship):
                XCTAssertEqual(starship.name, "Sentinel-class landing craft")
                XCTAssertEqual(starship.manufacturer, "Sienar Fleet Systems, Cyngus Spaceworks")
                XCTAssertEqual(starship.maxAtmospheringSpeed, "1000")
                XCTAssertEqual(starship.consumables, "1 month")
                XCTAssertTrue(starship.films?.contains(1) ?? false)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
