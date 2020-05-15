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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListFilms() throws {

        let api = SWCore.Api()
        let expectation = self.expectation(description: #function)

        api.films { result in

            switch result {
            case .success(let films):
                XCTAssert(films.count == 6)

            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 30)
    }
}
