//
//  SWCoreTests.swift
//  SWCoreTests
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
@testable import SWCore

class SWCoreTests: XCTestCase {

    var api: SWCore.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWCore.Api(baseUrl: testServer)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.api = nil
    }

    func testCountFilms() throws {

        let expectation = self.expectation(description: #function)

        self.api.countFilms() { result in

            switch result {
            case .success(let count):
                XCTAssertEqual(count, 6)
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }


    func testFetchFilm() throws {

        let expectation = self.expectation(description: #function)

        self.api.film(id: 1) { result in

            switch result {
            case .success(let film):
                XCTAssertEqual(film.title, "A New Hope")
                XCTAssertEqual(film.episodeId, 4)
                XCTAssertEqual(film.director, "George Lucas")
                XCTAssertEqual(film.characters[0].absoluteString, "http://swapi.dev/api/people/1/")
                // ...

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
