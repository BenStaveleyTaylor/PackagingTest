//
//  CorePersonTests.swift
//  SWCoreTests
//
//  Created by Ben Staveley-Taylor on 18/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
@testable import SWCore

class CorePersonTests: XCTestCase {

    var api: SWCore.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWCore.Api(baseUrl: testServer)
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

        // Result of: https://swapi.dev/api/people/1/

        self.api.person(id: 1) { result in

            switch result {
            case .success(let person):
                XCTAssertEqual(person.name, "Luke Skywalker")
                XCTAssertEqual(person.hairColor, "blond")
                XCTAssertEqual(person.birthYear, "19BBY")
                XCTAssertEqual(person.homeworld?.absoluteString, "http://swapi.dev/api/planets/1/")
                XCTAssertEqual(person.films?[0].absoluteString, "http://swapi.dev/api/films/1/")
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
