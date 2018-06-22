
//
//  CryptoManager.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import Alamofire
import BrightFutures
import Result

/// Handles retrieving Cryptocurrencies and managing a CryptoViewModel
class CryptoManager {
    
    // Mutable instance of a CryptoViewModel
    var viewModel: CryptoViewModel
    
    /// Initializer that creates a viewmodel that has a currencies array with 0 currencies in it to begin with
    init() {
        self.viewModel = CryptoViewModel()
    }
    
    /// Retrieves list of all available currencies from the server
    ///
    /// - Parameter completion: a completion block to be called after currencies are retrieved
    func getAllCurrencies(completion: @escaping () -> Void) {
        
        CryptoGetAllCurrenciesRequest()
            .makeRequestAndMap()
            .onSuccess { [weak self] (currencies) in
                self?.viewModel = CryptoViewModel(currencies: currencies)
                completion()
            }
            .onFailure { _ in
                // don't do anything right now
            }
    }
    
}













