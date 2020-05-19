//
//  FilmTests.swift
//  SWEngineeringTests
//
//  Created by Ben Staveley-Taylor on 19/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import XCTest
import SWEngineering

class FilmTests: XCTestCase {

    var api: SWEngineering.Api!

    override func setUpWithError() throws {

        let testServer: URL = URL(string: "https://localhost:60993/api")!
        self.api = SWEngineering.Api(baseUrl: testServer)
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

        // Result of: https://swapi.dev/api/films/1/

        self.api.film(id: 1) { result in

            switch result {
            case .success(let film):
                XCTAssertEqual(film.title, "A New Hope")
                XCTAssertEqual(film.episodeId, 4)
                XCTAssertEqual(film.director, "George Lucas")
                XCTAssertTrue(film.starships?.contains(2) ?? false)
                XCTAssertTrue(film.vehicles?.contains(4) ?? false)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }

}
