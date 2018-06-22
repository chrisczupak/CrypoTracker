//
//  CryptoGetAllCurrenciesRequest.swift
//  CryptoTrackerTests
//
//  Created by Christopher Czupak on 6/19/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import XCTest
@testable import Alamofire
@testable import BrightFutures
@testable import CryptoTracker

class CryptoGetAllCurrenciesAPIRequestTests: XCTestCase {
    
    func test_Initializer() {
        
        let request = CryptoGetAllCurrenciesRequest()
        
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.relativePath, "/assets")
        XCTAssertEqual(request.absolutePath, "https://api.cryptowat.ch/assets")
        
        XCTAssertNotNil(request.encoding)
        XCTAssertNil(request.headers)
        XCTAssertNil(request.parameters)
    }
    
    func test_Mapper() {
        
        let json: JSON = [
            "result": [
                [
                    "symbol": "eth",
                    "name": "Ethereum",
                    "fiat": false,
                    "route": "https://api.cryptowat.ch/assets/etc"
                ],
                [
                    "symbol": "btc",
                    "name": "Bitcoin",
                    "fiat": false,
                    "route": "https://api.cryptowat.ch/assets/btc"
                ],
            ]
        ]
        
        let response = CryptoGetAllCurrenciesRequest.map(from: json)
        XCTAssertNotNil(response.value)
        
        let allCurrencies = response.value!
        XCTAssertEqual(allCurrencies.count, 2)
        
        let ethereum = Cryptocurrency(name: "Ethereum", symbol: "eth", price: "Unavailable")
        let bitcoin = Cryptocurrency(name: "Bitcoin", symbol: "btc", price: "Unavailable")
        XCTAssertEqual(allCurrencies.first!, ethereum)
        XCTAssertEqual(allCurrencies.last!, bitcoin)
    }
    
}


