//
//  Utils.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

internal struct Utils {

    static func date(yyyymmdd: String) -> Date? {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.date(from: yyyymmdd)
    }

    static func identifiers(links: [String]) -> [Identifier] {

        let identifiers: [Identifier] = links.compactMap { link in
            // Strip the number off the end
            // Convert "http://swapi.dev/api/people/1/" to 1

            let trimmed = (link.last == "/") ? String(link.dropLast()) : link
            let parts = trimmed.split(separator: "/")
            if let idpart = parts.last {
                return Int(idpart)
            }

            return nil
        }

        return identifiers
    }

    static func listObjects<T>(json: JsonObject) -> [T] {
        
        if let results = json["results"] as? [JsonObject] {
            let objects: [T] = results.compactMap { object in
                return T(json: object)
            }

            return objects
        }
        
        return []
    }

}