//
//  CryptoGetCurrencyPriceAPIRequestTests.swift
//  CryptoTrackerTests
//
//  Created by Christopher Czupak on 6/19/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import XCTest
@testable import Alamofire
@testable import BrightFutures
@testable import CryptoTracker

class CryptoGetCurrencyPriceAPIRequestTests: XCTestCase {
    
    func test_Initializer() {
        
        let bitcoin = Cryptocurrency(name: "Bitcoin", symbol: "btc", price: "Unavailable")
        let request = CryptoGetCurrencyPriceAPIRequest.init(currency: bitcoin, exchange: .gdax, fiatSymbol: .usd)
        
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.relativePath, "/markets/gdax/btcusd/price")
        XCTAssertEqual(request.absolutePath, "https://api.cryptowat.ch/markets/gdax/btcusd/price")
        
        XCTAssertNotNil(request.encoding)
        XCTAssertNil(request.headers)
        XCTAssertNil(request.parameters)
    }
    
    func test_Mapper() {
        
        let json: JSON = [
            "result": [
                "price": 6510.23
            ]
        ]
        
        let response = CryptoGetCurrencyPriceAPIRequest.map(from: json)
        XCTAssertNotNil(response.value)
        
        let price = response.value!
        XCTAssertEqual(price, "6510.23")
    }
    
}

