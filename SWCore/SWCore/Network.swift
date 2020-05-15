//
//  Network.swift
//  SWCore
//
//  Created by Ben Staveley-Taylor on 14/05/2020.
//  Copyright © 2020 Oracle and/or its affiliates. All rights reserved.
//

import Foundation

typealias JsonObject = [String: Any]

internal struct Network {

    let baseUrl: URL

    func fetch<T: Codable & Fetchable>(item: Identifier, completion: @escaping (Result<T, Error>) -> Void) {

        // It seems to need a trailing slash, so isDirectory: true
        let fullUrl = self.baseUrl
            .appendingPathComponent(T.subPath)
            .appendingPathComponent(String(item), isDirectory: true)

        let request = URLRequest(url: fullUrl)
        print("Request: \(fullUrl)")

        let session = self.session()

        session.dataTask(with: request) { data, response, error in

            if let data = data {

                print("Response: \(String(data: data, encoding: .utf8)!)")

                let decoder = Utils.commonJsonDecoder()
                if let object = try? decoder.decode(T.self, from: data) {
                    completion(.success(object))
                    return
                }
            }

            // If we got here it's an error
            completion(.failure(error ?? URLError(.unknown)))

        }.resume()
    }

    func count(subPath: String, completion: @escaping (Result<Int, Error>) -> Void) {

        // It seems to need a trailing slash, so isDirectory: true
        let fullUrl = self.baseUrl
            .appendingPathComponent(subPath, isDirectory: true)

        let request = URLRequest(url: fullUrl)
        print("Request: \(fullUrl)")

        let session = self.session()

        session.dataTask(with: request) { data, response, error in

            if let data = data {

                print("Response: \(String(data: data, encoding: .utf8)!)")

                let decoder = Utils.commonJsonDecoder()
                if let object = try? decoder.decode(RawContainer.self, from: data) {
                    completion(.success(object.count))
                    return
                }
            }

            // If we got here it's an error
            completion(.failure(error ?? URLError(.unknown)))

        }.resume()
    }

    internal func session() -> URLSession {
        let result = URLSession(configuration: .default,
                                delegate: MySessionDelegate(),
                                delegateQueue: nil)
        return result
    }
}

private class MySessionDelegate: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        let protectionSpace = challenge.protectionSpace

        guard protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust,
            let serverTrust = protectionSpace.serverTrust else {
                completionHandler(.performDefaultHandling, nil)
                return
        }

        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
    }
}
