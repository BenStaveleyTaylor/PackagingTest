//
//  CoreContainer.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 15/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

public struct CoreContainer: Decodable {

    let count: Int
    let next: URL?
    let previous: URL?
    // Not modelling: results: [Any]
}
