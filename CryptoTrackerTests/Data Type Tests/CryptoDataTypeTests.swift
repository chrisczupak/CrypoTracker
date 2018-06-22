//
//  CryptoDataTypeTests.swift
//  CryptoTrackerTests
//
//  Created by Christopher Czupak on 6/19/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import XCTest
@testable import CryptoTracker

class CryptoDataTypeTests: XCTestCase {
    
    func test_CryptoAPIError() {
        let error = CryptoAPIError.unknown
        XCTAssertEqual(error, .unknown)
    }
    
    func test_CryptoExchange() {
        
        let bitfinex = CryptoExchange.bitfinex
        XCTAssertEqual(bitfinex, .bitfinex)
        XCTAssertEqual("\(bitfinex)", "bitfinex")
        
        let bitstamp = CryptoExchange.bitstamp
        XCTAssertEqual(bitstamp, .bitstamp)
        XCTAssertEqual("\(bitstamp)", "bitstamp")
        
        let gdax = CryptoExchange.gdax
        XCTAssertEqual(gdax, .gdax)
        XCTAssertEqual("\(gdax)", "gdax")
        
        let gemini = CryptoExchange.gemini
        XCTAssertEqual(gemini, .gemini)
        XCTAssertEqual("\(gemini)", "gemini")
        
        let kraken = CryptoExchange.kraken
        XCTAssertEqual(kraken, .kraken)
        XCTAssertEqual("\(kraken)", "kraken")
    }
    
    func test_FiatSymbol() {
        
        let yuan = FiatSymbol.cny
        XCTAssertEqual(yuan, .cny)
        XCTAssertEqual("\(yuan)", "cny")
        
        let euro = FiatSymbol.eur
        XCTAssertEqual(euro, .eur)
        XCTAssertEqual("\(euro)", "eur")
        
        let pound = FiatSymbol.gbp
        XCTAssertEqual(pound, .gbp)
        XCTAssertEqual("\(pound)", "gbp")
        
        let yen = FiatSymbol.jpy
        XCTAssertEqual(yen, .jpy)
        XCTAssertEqual("\(yen)", "jpy")
        
        let won = FiatSymbol.krw
        XCTAssertEqual(won, .krw)
        XCTAssertEqual("\(won)", "krw")
        
        let dollar = FiatSymbol.usd
        XCTAssertEqual(dollar, .usd)
        XCTAssertEqual("\(dollar)", "usd")
    }

}
