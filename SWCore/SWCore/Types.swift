//
//  Types.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

public typealias Identifier = Int
public typealias Identifiers = [Identifier]

protocol Fetchable {

    // resource sub path, to append to base URL
    static var subPath: String { get }
}
