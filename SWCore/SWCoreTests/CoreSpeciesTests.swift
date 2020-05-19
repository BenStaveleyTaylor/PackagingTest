//
//  CoreSpeciesTests.swift
//  SWCoreTests
//
//  Created by Ben Staveley-Taylor on 18/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
import SWCore

class CoreSpeciesTests: XCTestCase {

    var api: SWCore.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWCore.Api(baseUrl: testServer)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.api = nil
    }

    func testCountSpecies() throws {

        let expectation = self.expectation(description: #function)

        self.api.countSpecies() { result in

            switch result {
            case .success(let count):
                XCTAssertEqual(count, 37)
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }


    func testFetchSpecies() throws {

        let expectation = self.expectation(description: #function)

        // Result of: https://swapi.dev/api/species/3/

        self.api.species(id: 3) { result in

            switch result {
            case .success(let species):
                XCTAssertEqual(species.name, "Wookie")
                XCTAssertEqual(species.classification, "mammal")
                XCTAssertEqual(species.averageHeight, "210")
                XCTAssertEqual(species.language, "Shyriiwook")
                XCTAssertEqual(species.homeworld?.absoluteString, "http://swapi.dev/api/planets/14/")
                XCTAssertEqual(species.people?[0].absoluteString, "http://swapi.dev/api/people/13/")
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
