//
//  Utils.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

public struct Utils {

    // Read dates like "1976-05-04"
    static var yyymmddDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }

    static func commonJsonDecoder() -> JSONDecoder {

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(Utils.yyymmddDateFormatter)

        return decoder
    }

    public static func identifiers(links: [URL]?) -> [Identifier]? {

        guard let links = links else {
            return nil
        }

        let identifiers: [Identifier] = links.compactMap { link in

            // Convert "http://swapi.dev/api/people/1/" to 1
            let idpart = link.lastPathComponent
            return Int(idpart)
        }

        return identifiers
    }
}
