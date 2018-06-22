//
//  CryptoViewModel.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

/// A model used to hold data to display cryptocurrencies and prices
struct CryptoViewModel {
    
    // Array of cryptocurrencies available for view
    var currencies: [Cryptocurrency]
    
    /// Initializer for creating a cryptocurrency view model
    ///
    /// - Parameter currencies: array of currencies to manage and display. Defaults to empty array
    init(currencies: [Cryptocurrency] = [Cryptocurrency]()) {
        self.currencies = currencies
    }
    
}
