//
//  CryptoManagerTests.swift
//  CryptoTrackerTests
//
//  Created by Christopher Czupak on 6/21/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import XCTest
@testable import CryptoTracker

class CryptoManagerTests: XCTestCase {
    
    func test_Initializer() {
        let manager = CryptoManager()
        XCTAssertNotNil(manager)
        XCTAssertNotNil(manager.viewModel)
        XCTAssertEqual(manager.viewModel.currencies.count, 0)
    }
    
}
