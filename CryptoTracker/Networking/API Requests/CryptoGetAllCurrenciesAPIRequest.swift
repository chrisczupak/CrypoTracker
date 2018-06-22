//
//  CryptoGetAllCurrenciesAPIRequest.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import Alamofire
import BrightFutures
import Result

/// A request object to retrieve all available cryptocurrencies
struct CryptoGetAllCurrenciesRequest: CryptoAPIRequestExecutable {
    var relativePath: String = "/assets"
    var method: HTTPMethod = .get
}

extension CryptoGetAllCurrenciesRequest: CryptoAPIResponseMappable {
    
    static func map(from json: Any) -> Future<[Cryptocurrency], CryptoAPIError> {
        
        guard let json = json as? [String: Any],
              let allCurrencies = json["result"] as? [[String: Any]] else {
                return Future(error: .unknown)
        }
        
        return Future(value: allCurrencies.flatMap{ Cryptocurrency(json: $0) } // converts json to cryptocurrency if possible and removes fiat currencies (objects that return 'nil' from the fallible initializer)
        )
    }
    
}

