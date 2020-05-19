//
//  PersonTests.swift
//  SWBioResourcesTests
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
import SWBioResources

class PersonTests: XCTestCase {

    var api: SWBioResources.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWBioResources.Api(baseUrl: testServer)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.api = nil
    }

    func testCountPeople() throws {

        let expectation = self.expectation(description: #function)

        self.api.countPeople() { result in

            switch result {
            case .success(let count):
                XCTAssertEqual(count, 82)
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }


    func testFetchPerson() throws {

        let expectation = self.expectation(description: #function)

        // Result of: https://swapi.dev/api/people/2/

        self.api.person(id: 2) { result in

            switch result {
            case .success(let person):
                XCTAssertEqual(person.name, "C-3PO")
                XCTAssertEqual(person.hairColor, "n/a")
                XCTAssertEqual(person.birthYear, "112BBY")
                XCTAssertEqual(person.homeworld!, 1)
                XCTAssertTrue(person.films?.contains(3) ?? false)
                XCTAssertTrue(person.species?.contains(2) ?? false)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
