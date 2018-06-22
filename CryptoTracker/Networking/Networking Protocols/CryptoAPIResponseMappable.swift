//
//  CryptoAPIResponseMappable.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import BrightFutures

/// A protocol to give each request a mapper to convert json in to usable objects
protocol CryptoAPIResponseMappable {
    associatedtype ReturnType
    static func map(from json: JSON) -> Future<Self.ReturnType, CryptoAPIError>
}

/// A default protocol implementation where any request that conforms to both CryptoAPIRequestExecutable and CryptoAPIResponseMappable gets a convenience function that makes a request and returns a mapped object using the requests 'map(from)' function
extension CryptoAPIRequestExecutable where Self: CryptoAPIResponseMappable {
    
    func makeRequestAndMap() -> Future<Self.ReturnType, CryptoAPIError> {
        return makeRequest().flatMap{ json in Self.map(from: json) }
    }
    
}
