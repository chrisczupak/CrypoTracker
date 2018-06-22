//
//  CryptoGetCurrencyPriceAPIRequest.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

import Alamofire
import BrightFutures

/// A request object to get the current price for any given cryptocurrency
struct CryptoGetCurrencyPriceAPIRequest: CryptoAPIRequestExecutable {
    
    var method: HTTPMethod = .get
    var relativePath: String
    
    let currency: Cryptocurrency
    let exchange: CryptoExchange
    let fiatSymbol: FiatSymbol
    
    /// Initializer for the price retrieval request
    ///
    /// - Parameters:
    ///   - currency: currency to retrieve the price for
    ///   - exchange: exchange to retrieve the price from
    ///   - fiatSymbol: fiat denomination to display the price in
    init(currency: Cryptocurrency, exchange: CryptoExchange, fiatSymbol: FiatSymbol) {
        
        self.currency = currency
        self.exchange = exchange
        self.fiatSymbol = fiatSymbol
        
        self.relativePath = "/markets/\(exchange)/\(currency.symbol)\(fiatSymbol)/price"
    }
    
}

extension CryptoGetCurrencyPriceAPIRequest: CryptoAPIResponseMappable {
    
    static func map(from json: Any) -> Future<String, CryptoAPIError> {
        
        guard let json = json as? [String: Any],
              let result = json["result"] as? [String: Any],
              let price = result["price"] as? Double else {
                return Future(error: .unknown)
        }
        
        return Future(value: String(price))
    }
    
}
