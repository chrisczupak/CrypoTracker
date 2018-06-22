//
//  CryptocurrencyTests.swift
//  CryptoTrackerTests
//
//  Created by Christopher Czupak on 6/19/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import XCTest
@testable import CryptoTracker

class CryptocurrencyTests: XCTestCase {

    func test_Initializer() {
        
        let currency = Cryptocurrency(name: "Bitcoin", symbol: "btc", price: "6721.35")
        
        XCTAssertNotNil(currency)
        XCTAssertEqual(currency.name, "Bitcoin")
        XCTAssertEqual(currency.price, "6721.35")
        XCTAssertEqual(currency.symbol, "btc")
    }
    
    func test_FallibleInitializer_Success() {
        
        let json: [String: Any] = ["fiat": false, "name": "Bitcoin", "symbol": "btc"]
        let currency = Cryptocurrency(json: json)
        
        XCTAssertNotNil(currency)
        XCTAssertEqual(currency?.name, "Bitcoin")
        XCTAssertEqual(currency?.symbol, "btc")
        XCTAssertEqual(currency?.price, "Unavailable")
    }
    
    func test_FallibleInitializer_Failure_MissingKey() {
        
        let json: [String: Any] = ["fiat": false, "name": "Bitcoin"]
        let currency = Cryptocurrency(json: json)
        
        XCTAssertNil(currency)
    }
    
    func test_FallibleInitializer_Failure_FiatCurrency() {
        
        let json: [String: Any] = ["fiat": true, "name": "US Dollar", "symbol": "usd"]
        let currency = Cryptocurrency(json: json)
        
        XCTAssertNil(currency)
    }
    
}
