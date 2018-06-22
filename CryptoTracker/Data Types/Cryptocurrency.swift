//
//  Cryptocurrency.swift
//  CryptoTracker
//
//  Created by Christopher Czupak on 6/17/18.
//  Copyright © 2018 Christopher Czupak. All rights reserved.
//

/// An object that represents a cryptocurrency and its properties
struct Cryptocurrency {
    
    let name    : String
    let symbol  : String
    var price   : String
    
    /// Initializer for creating a cryptocurrency
    ///
    /// - Parameters:
    ///   - name: full currency name
    ///   - symbol: currency trading symbol
    ///   - price: current currency price. Defaults to unavailable
    init(name: String, symbol: String, price: String = "Unavailable") {
        self.name = name
        self.symbol = symbol
        self.price = price
    }
    
    /// Fallible initializer for creating a cryptocurrency from json
    ///
    /// - Parameters:
    ///   - json: json structure to attempt to create a cryptocurrency object from
    init?(json: [String: Any]) {
        
        guard let isFiat = json["fiat"] as? Bool,
              !isFiat, // We don't want to include fiat currencies (usd, eur, etc...) in our final list
              let name = json["name"] as? String,
              let symbol = json["symbol"] as? String else {
                return nil
        }
        
        self.name = name
        self.symbol = symbol
        self.price = "Unavailable"
    }
    
}

// Equatable conformance to compare to Cryptocurrency objects
extension Cryptocurrency: Equatable {
    
    static func ==(lhs: Cryptocurrency, rhs: Cryptocurrency) -> Bool {
        return lhs.name == rhs.name
            && lhs.symbol == rhs.symbol
            && lhs.price == rhs.price
    }
    
}
