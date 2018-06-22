//
//  CryptoViewModelTests.swift
//  CryptoTrackerTests
//
//  Created by Christopher Czupak on 6/19/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import XCTest
@testable import CryptoTracker

class CrytoViewModelTests: XCTestCase {

    func test_CryptoViewModel_DefaultParams() {
        let viewModel = CryptoViewModel()
        XCTAssertTrue(viewModel.currencies.isEmpty)
    }
    
    func test_CryptoViewModel_WithCurrencies() {
        
        let bitcoin = Cryptocurrency(name: "Bitcoin", symbol: "btc", price: "6701.35")
        let ethereum = Cryptocurrency(name: "Ethereum", symbol: "eth", price: "536.22")
        
        let currencies = [
            bitcoin,
            ethereum
        ]
        
        let viewModel = CryptoViewModel(currencies: currencies)
        
        XCTAssertFalse(viewModel.currencies.isEmpty)
        XCTAssertEqual(viewModel.currencies.count, 2)
        XCTAssertEqual(viewModel.currencies.first!, bitcoin)
        XCTAssertEqual(viewModel.currencies.last!, ethereum)
    }

}
